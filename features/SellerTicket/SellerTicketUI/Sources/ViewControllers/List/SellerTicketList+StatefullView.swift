//
//  SellerTicketList+StatefullView.swift
//  AppLibrary
//
//  Created by wtildestar on 24/05/2020.
//

import EsoftUIKit
import RxSwift
import ListKit
import SellerTicketImplementation
import StateKit
import IGListDiffKit.IGListDiffable
import RxExtensions

extension SellerTicketList: StatefullView {
  public func bind(store: SellerTicketListState) {
    let state = store.state.distinctUntilChanged().share().debug()
    
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
    
    rx
      .viewWillAppear
      .map { _ in SellerTicketListState.Action.fetchSellerTicket }
      .bind(to: store.action)
      .disposed(by: disposeBag)
    
    let skeleton = state
      .filter { $0.initialLoading == true }
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
      .filter { $0.initialLoading == false && $0.sellerTicket == nil }
      .map { _ in [
        EmptyListViewModel(title: "Empty", message: Localized.search, image: UIImage.Stub.specialists)
        ]}
      .map { $0.mapToSellerTicketSections() }
    
    let sellerTicket = state
      .filter { $0.initialLoading == false && $0.sellerTicket != nil }
      .map { $0.sellerTicket }
      .map { $0.map { $0.asViewModel() } }
//      .map { $0.mapToSellerTicketSections() }
    
    guard let adapter = specializedView.adapter else { return }
    
    Observable.of(
      skeleton,
      empty
    )
      .merge()
      .bind(to: adapter.rx.objects(for: source))
      .disposed(by: disposeBag)
  }
}
