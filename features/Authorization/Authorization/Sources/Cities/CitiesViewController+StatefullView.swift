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

extension CitiesViewController: StatefullView {
  public func bind(store: CitiesViewControllerState) {
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
    
    // MARK: - Data
    let state = store.state.distinctUntilChanged().share()
    
    let source = RxListAdapterDataSource<CitiesSections>(sectionControllerProvider: { _, section in
      switch section {
      case .header:
        return ListHeaderSectionController()
      case .city:
        return CitiesSectionController()
      case .location:
        return LocationSectionController()
      case .message:
        return MessageSectionController()
      }
    })
    
    guard let adapter = specializedView.adapter else { return }
    
    let header: Observable<[CitiesSections]> = Observable.just([
      ListHeaderViewModel(count: -1, title: Localized.location),
      LocationViewModel(id: 0, name: "123")
    ])
      .map { $0.mapToCitiesSections() }
    
    let countries: Observable<[CitiesSections]> = state
      .map { state in state.countries.reduce([], { arr, country in
        arr + [ListHeaderViewModel(count: country.id, title: country.name)] + country.cities.map { $0.asViewModel()
        }
      }) }
      .map { $0.mapToCitiesSections() }
    
    var message: Observable<[CitiesSections]> = state
      .map { state -> [MessageViewModel] in
        if !state.isSearching && (state.filter == nil || state.filter == "") {
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
