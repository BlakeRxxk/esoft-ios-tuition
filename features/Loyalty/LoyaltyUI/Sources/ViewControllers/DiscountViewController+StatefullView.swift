//
//  Discount+StatefullView.swift
//  LoyaltyUI
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import EsoftUIKit
import RxSwift
import RxCocoa
import ListKit
import LoyaltyImplementation
import StateKit
import IGListDiffKit.IGListDiffable
import RxExtensions

extension DiscountViewController: StatefullView {
  public func bind(store: LoyaltyListState) {
    let state = store.state.distinctUntilChanged().share()
    
    let source = RxListAdapterDataSource<DiscountSections>(sectionControllerProvider: { _, section in
      switch section {
      case .empty:
        return EmptyListSectionController()
//      case .skeleton:
//        return DiscounSkeletonSectionController()
      case .discount:
        return DiscountSectionController()
      }
    })

    // state
    //   .map { $0.isLoading }
    //   .debounce(.milliseconds(300), scheduler: MainScheduler.instance)
    //   .bind(to: specializedView.refreshControl.rx.isRefreshing)
    //   .disposed(by: disposeBag)

    rx
      .viewWillAppear
      .map { _ in LoyaltyListState.Action.fetchLoyalty }
      .bind(to: store.action)
      .disposed(by: disposeBag)
    
    // specializedView
    //   .refreshControl
    //   .rx
    //   .controlEvent(.valueChanged)
    //   .debounce(.milliseconds(300), scheduler: MainScheduler.instance)
    //   .map { LoyaltyListState.Action.refreshMySpecialists }
    //   .bind(to: store.action)
    //   .disposed(by: disposeBag)
    
    let skeleton = state
      .filter { $0.initialLoading == true }
//      .map { _ in [
//        ListHeaderSkeletonViewModel(id: 0),
//        DiscountSkeletonViewModel(id: 1),
//        DiscountSkeletonViewModel(id: 2),
//        DiscountSkeletonViewModel(id: 3),
//        DiscountSkeletonViewModel(id: 4),
//        DiscountSkeletonViewModel(id: 5)
//        ]}
      .map { $0.loyalty }
      .map { $0.mapToDiscountSections() }
    
//    let empty = state
//      .filter { $0.initialLoading == false && $0.loyalty.isEmpty }
//      .map { $0.loyalty }
//      .map { $0.mapToDiscountSections() }
    
    let discount = state
      .filter { $0.initialLoading == false && !$0.loyalty.isEmpty }
      .map { $0.loyalty }
      .map { $0.mapToDiscountSections() }
    
    guard let adapter = specializedView.adapter else {
      return
    }

    Observable.of(
      skeleton,
//      empty,
      discount
    )
      .merge()
      .bind(to: adapter.rx.objects(for: source))
      .disposed(by: disposeBag)
    
  }
}
