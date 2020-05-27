//
//  AuthCitiesViewController+StatefullView.swift
//  AppLibrary
//
//  Created by nedstar on 26.05.2020.
//

import EsoftUIKit
import RxSwift
import ListKit
import StateKit
import IGListDiffKit.IGListDiffable

extension CitiesViewController: StatefullView {
  public func bind(store: CitiesViewControllerState) {
    let state = store.state.distinctUntilChanged().share()
    
    let source = RxListAdapterDataSource<CitiesSections>(sectionControllerProvider: { _, section in
      switch section {
      case .header:
        return ListHeaderSectionController()
      case .cities:
        return CitiesSectionController()
      case .location:
        return LocationSectionController()
      }
    })
    
    guard let adapter = specializedView.adapter else { return }
    
    Observable.just([
      ListHeaderViewModel(count: 0, title: "Ваше местоположение"),
      LocationViewModel(id: 0, name: "123"),
      ListHeaderViewModel(count: 1, title: "Россия"),
      CityViewModel(id: 1, name: "Москва", regions: ["Химки"]),
      CityViewModel(id: 2, name: "Тюмень", regions: []),
      ListHeaderViewModel(count: 2, title: "Германия"),
      CityViewModel(id: 3, name: "Берлин", regions: ["Мюнхен", "Гамбург", "Кёльн", "Штуртгарт", "Лейпциг", "Бремен", "Ганновер"]),
      CityViewModel(id: 4, name: "Дюссельдорф", regions: [], isComingSoon: true)
      ].mapToAuthCitiesSections())
      .bind(to: adapter.rx.objects(for: source))
      .disposed(by: disposeBag)
  }
}
