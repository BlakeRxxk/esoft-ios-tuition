//
//  AuthCitiesViewController+StatefullView.swift
//  AppLibrary
//
//  Created by nedstar on 26.05.2020.
//

import EsoftUIKit
import YogaKit
import RxExtensions
import ListKit
import StateKit
import IGListDiffKit.IGListDiffable
import AuthCore
import AuthImplementation

extension CitiesViewController: StatefullView {
  public func bind(store: CitiesListState) {
    // MARK: - KeyboardHeight
    RxKeyboard
      .instance
      .visibleHeight
      .drive(onNext: { [unowned self] keyboardVisibleHeight in
        print(keyboardVisibleHeight)
        self.view.yoga.paddingBottom = YGValue(keyboardVisibleHeight)
        self.view.yoga.applyLayout(preservingOrigin: true)
        self.view.layoutIfNeeded()
      })
      .disposed(by: disposeBag)
    
    // MARK: - SearchBar
    searchController.searchBar.rx
      .textDidBeginEditing
      .asObservable()
      .map { _ in Store.Action.startSearching }
      .bind(to: store.action)
      .disposed(by: disposeBag)
    
    searchController.searchBar.rx
      .text
      .map { text in Store.Action.changeFilter(text)}
      .bind(to: store.action)
      .disposed(by: disposeBag)
    
    searchController.searchBar.rx
      .textDidEndEditing
      .asObservable()
      .map { _ in Store.Action.stopSearching }
      .bind(to: store.action)
      .disposed(by: disposeBag)
    
    // MARK: - State
    let state = store.state.distinctUntilChanged().share()
    
    let source = RxListAdapterDataSource<CitiesSections>(sectionControllerProvider: { _, section in
      switch section {
      case .header:
        return ListHeaderSectionController()
      case .myCity:
        return MyCitySectionController(output: self)
      case .city:
        return CitiesSectionController(output: self)
      case .message:
        return MessageSectionController()
      }
    })
    
    guard let adapter = specializedView.adapter else { return }
    
    // MARK: - Init
    rx
      .viewWillAppear
      .debounce(.milliseconds(300), scheduler: MainScheduler.instance)
      .map { _ in CitiesListState.Action.fetchData }
      .bind(to: store.action)
      .disposed(by: disposeBag)
    
    // MARK: - Refresh
    specializedView
      .refreshControl
      .rx
      .controlEvent(.valueChanged)
      .debounce(.milliseconds(300), scheduler: MainScheduler.instance)
      .map { CitiesListState.Action.refreshData }
      .bind(to: store.action)
      .disposed(by: disposeBag)
    
    state
      .map { $0.isLoading }
      .debounce(.milliseconds(300), scheduler: MainScheduler.instance)
      .bind(to: specializedView.refreshControl.rx.isRefreshing)
      .disposed(by: disposeBag)
    
    // MARK: - List
    let header: Observable<[CitiesSections]> = state
      .map { state in
        [
          ListHeaderViewModel(count: -1, title: Localized.location),
          MyCityViewModel(id: state.myCity?.id ?? "0", name: state.myCity?.name, distance: state.myCity?.distance, isLocating: state.isLocating)]
          .filter { _ in !state.isSearching }
      }
      .map { $0.mapToCitiesSections() }
    
    let countries: Observable<[CitiesSections]> = state
      .map { state in
        state.countries.mapValues { $0.filter { myFilter($0.name, state.filter) } }
        .filter { !$1.isEmpty }
        .sorted(by: { $0.key.id < $1.key.id || $0.value.contains(where: { String($0.id) == state.myCity?.id ?? "" })})
        .reduce([]) { arr, tuple in
          let country = tuple.key
          let cities = tuple.value
          return arr +
            [ListHeaderViewModel(count: country.id, title: country.name)] +
            cities.map { $0.asViewModel(isSelected: $0.id == state.selectedCityId ?? -1) }.sorted(by: { lhs, rhs in
              lhs.id < rhs.id || String(lhs.id) == state.myCity?.id ?? ""
            })
        }
        .mapToCitiesSections()
      }
    
    let message: Observable<[CitiesSections]> = state
      .map { state -> [ListDiffable] in
        guard state.isSearching || state.filter.isEmpty else {
          return []
        }
        return [MessageViewModel(id: 0, message: Localized.message)]
      }
      .map { $0.mapToCitiesSections() }
    
    Observable.combineLatest(header, countries, message) { $0 + $1 + $2 }
      .bind(to: adapter.rx.objects(for: source))
      .disposed(by: disposeBag)
  }
}

// Переименовать и переместить в Esoft
func myFilter(_ text: String, _ filter: String?) -> Bool {
  guard let filter = filter, !filter.isEmpty else {
    return true
  }
  return text.uppercased().contains(filter.uppercased())
}
