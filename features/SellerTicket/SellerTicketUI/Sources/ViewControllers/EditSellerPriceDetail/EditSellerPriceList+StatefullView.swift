//
//  EditSellerPriceList+StatefullView.swift
//  SellerTicketUI#iphonesimulator-x86_64
//
//  Created by wtildestar on 17/06/2020.
//

import EsoftUIKit
import RxSwift
import ListKit
import SellerTicketImplementation
import StateKit
import IGListDiffKit.IGListDiffable
import RxExtensions

extension EditSellerPriceController: StatefullView {
  public func bind(store: EditSellerPriceListState) {
    let state = store.state.distinctUntilChanged().share().debug()
    
    let source = RxListAdapterDataSource<EditSellerPriceSections>(sectionControllerProvider: { _, section in
      switch section {
      case .header:
        return ListHeaderSectionController()
      case .empty:
        return EmptyListSectionController()
      case .editSellerPrice:
        return EditSellerPriceSectionController()
      }
    })
    
    rx
      .viewWillAppear
      .map { _ in EditSellerPriceListState.Action.fetchRecomendedPrice }
      .bind(to: store.action)
      .disposed(by: disposeBag)
    
    let empty = state
      .filter { $0.initialLoading == false && $0.recomendedPrice == nil }
      .map { _ in [
        EmptyListViewModel(title: "Empty", message: Localized.search, image: UIImage.Stub.specialists)
        ]}
      .map { $0.mapToEditSellerPriceSections() }
    
    let editSellerPrice = state
      .filter { $0.initialLoading == false && $0.recomendedPrice != nil }
      .map { $0.recomendedPrice }
      .map { $0.map { $0.asViewModel() } }
      .map { $0.mapToEditSellerPriceSections() }
    
    guard let adapter = specializedView.adapter else { return }
    
    Observable.of(
      empty,
      editSellerPrice
    )
      .merge()
      .bind(to: adapter.rx.objects(for: source))
      .disposed(by: disposeBag)
  }
}