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
      case .city:
        return CitiesSectionController(output: self)
      case .myCity:
        return MyCitySectionController(output: self)
      case .message:
        return MessageSectionController()
      }
    })
    
    guard let adapter = specializedView.adapter else { return }
    
    rx
      .viewWillAppear
      .debounce(.milliseconds(300), scheduler: MainScheduler.instance)
      .map { _ in CitiesListState.Action.fetchData }
      .bind(to: store.action)
      .disposed(by: disposeBag)
    
    state
      .map { $0.selectedCityId }
      .bind(onNext: { print($0) })
      .disposed(by: disposeBag)
    
    let header: Observable<[CitiesSections]> = state.map { state in
      if state.isSearching {
        return []
      }
      return [
        ListHeaderViewModel(count: -1, title: Localized.location),
        MyCityViewModel(id: 0, name: nil, distance: 123)]
//        .filter { !state.isSearching }
        .mapToCitiesSections()
    }
    
    let countries: Observable<[CitiesSections]> = state
//      .debounce(.milliseconds(300), scheduler: MainScheduler.instance)
      .map { state in
        state.countries.mapValues { cities in
          cities.filter { myFilter($0.name, state.filter) }
        }
        .filter { !$1.isEmpty }
        .sorted(by: { $0.key.id < $1.key.id })
        .reduce([]) { arr, tuple in
          let country = tuple.key
          let cities = tuple.value
          return arr + [ListHeaderViewModel(count: country.id, title: country.name)] + cities.map { $0.asViewModel() }
        }
        .mapToCitiesSections()
    }
    
    var message: Observable<[CitiesSections]> = state
      .map { state -> [MessageViewModel] in
        if !state.isSearching && (state.filter == nil || state.filter == "") { // скобки для наглядности
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
func myFilter(_ text: String, _ filter: String?) ->  Bool
{
  guard let filter = filter, filter != "" else {
    return true
  }
  return text.uppercased().contains(filter.uppercased())
}
