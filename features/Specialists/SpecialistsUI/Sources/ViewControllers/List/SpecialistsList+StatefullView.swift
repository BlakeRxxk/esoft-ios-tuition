//
//  SpecialistsList+StatefullView.swift
//  SpecialistsUI
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import EsoftUIKit
import RxSwift
import RxCocoa
import ListKit
import SpecialistsImplementation
import StateKit
import IGListDiffKit.IGListDiffable
import RxExtensions

extension SpecialistsList: StatefullView {
  public func bind(store: SpecialistsListState) {
    let state = store.state.distinctUntilChanged().share().debug()
    
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
        return SpecialistsSectionController(output: self)
      }
    })

//    state
//      .map { $0.isLoading }
//      .debounce(.milliseconds(300), scheduler: MainScheduler.instance)
//      .bind(to: specializedView.refreshControl.rx.isRefreshing)
//      .disposed(by: disposeBag)

    rx
      .viewWillAppear
      .map { [weak self] _ in
        guard let `self` = self else { return .empty }

        if self.store?.currentState.specialists == self.store?.initialState.specialists,
          self.store?.currentState.page == self.store?.initialState.page,
          self.store?.currentState.pages == self.store?.initialState.pages {
          return SpecialistsListState.Action.fetchSpecialists()
        }
        return .empty
      }
      .bind(to: store.action)
      .disposed(by: disposeBag)
    
    specializedView
      .refreshControl
      .rx
      .controlEvent(.valueChanged)
      .debounce(.milliseconds(300), scheduler: MainScheduler.instance)
      .map { SpecialistsListState.Action.refreshMySpecialists }
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
      .map { $0.mapToSpecialistsSections() }
    
    let empty = state
        .filter { $0.initialLoading == false && $0.specialists.isEmpty }
        .map { _ in [
            EmptyListViewModel(title: "Empty", message: Localized.search, image: UIImage.Stub.specialists)
            ]}
        .map { $0.mapToSpecialistsSections() }

    let specialists = state
      .filter { $0.initialLoading == false && !$0.specialists.isEmpty }
      .map { $0.specialists }
      .map { [ListHeaderViewModel(count: 0, title: Localized.title, icon: UIImage())] + $0 }
      .map { $0.mapToSpecialistsSections() }
    
    guard let adapter = specializedView.adapter else {
        return
    }

    Observable.of(
      skeleton,
      empty,
      specialists
    )
      .merge()
      .bind(to: adapter.rx.objects(for: source))
      .disposed(by: disposeBag)
    
  }
}
