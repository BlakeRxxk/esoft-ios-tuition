//
//  SellerTicketList+StatefullView.swift
//  AppLibrary
//
//  Created by wtildestar on 24/05/2020.
//

import EsoftUIKit
import RxSwift
import ListKit
import SpecialistsImplementation
import StateKit
import IGListDiffKit.IGListDiffable

extension SellerTicketList: StatefullView {
  public func bind(store: SellerTicketListState) {
    let state = store.state.distinctUntilChanged().share()
    
    let source = RxListAdapterDataSource<SellerTicketSections>(sectionControllerProvider: { _, section in
      switch section {
      case .header:
        return ListHeaderSectionController()
      case .empty:
        return EmptyListSectionController()
      case .listHeaderSkeleton:
        return ListHeaderSkeletonSectionController()
      case .skeleton:
        return SellerTicketListSkeletonSectionController()
      case .sellerTicket:
        return SellerTicketSectionController()
      }
    })
    
    let skeleton = state
      .filter { $0.initialLoading == true}
      .map { _ in [
        ListHeaderSkeletonViewModel(id: 0),
        ListSkeletonViewModel(id: 1),
        ListSkeletonViewModel(id: 2),
        ListSkeletonViewModel(id: 3),
        ListSkeletonViewModel(id: 4),
        ListSkeletonViewModel(id: 5)
        ]}
      .map { $0.mapToSellerTicketSections() }
    
    let empty = state
//      .filter { $0.initialLoading == false && $0.specialists.isEmpty }
      .map { _ in [
        EmptyListViewModel(title: "Empty", message: Localized.search, image: UIImage.Stub.specialists)
        ]}
      .map { $0.mapToSellerTicketSections() }
    
    guard let adapter = specializedView.adapter else {
      return
    }
    
    Observable.of(
      skeleton,
      empty
    )
      .merge()
      .bind(to: adapter.rx.objects(for: source))
      .disposed(by: disposeBag)
  }
}
