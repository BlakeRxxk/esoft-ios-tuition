//
//  SpecialistsList+StatefullView.swift
//  SpecialistsUI
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import EsoftUIKit
import RxSwift
import ListKit
import SpecialistsImplementation
import StateKit
import IGListDiffKit.IGListDiffable

extension SpecialistsList: StatefullView {
  public func bind(store: SpecialistsListState) {
    let state = store.state.distinctUntilChanged().share()
    
    let source = RxListAdapterDataSource<SpecialistsSections>(sectionControllerProvider: { _, section in
      switch section {
      case .header:
        return ListHeaderSectionController()
      case .empty:
        return EmptyListSectionController()
      case .listHeaderSkeleton:
        return ListHeaderSkeletonSectionController()
      case .skeleton:
        return SpecialistsListSkeletonSectionController()
      case .specialists:
        return SpecialistsSectionController()
      }
    })
    
    let skeleton = state
      .filter { $0.initialLoading == true}
      .map { _ in [
        ListHeaderSkeletonViewModel(id: 0),
        ListSkeletonViewModel(id: 1),
        ListSkeletonViewModel(id: 2)
        ]}
      .map { $0.mapToSpecialistsSections() }
    
    let empty = state
      .filter { $0.initialLoading == false && $0.specialists.isEmpty }
      .map { _ in [
        EmptyListViewModel(title: "Empty", message: Localized.search, image: UIImage.Stub.specialists)
        ]}
      .map { $0.mapToSpecialistsSections() }
    
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
