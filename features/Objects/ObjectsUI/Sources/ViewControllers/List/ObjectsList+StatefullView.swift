//
//  ObjectsList+StatefullView.swift
//  ObjectsUI#iphonesimulator-x86_64
//
//  Created by Алексей Макаров on 29.05.2020.
//

import EsoftUIKit
import RxSwift
import RxCocoa
import ListKit
import ObjectsImplementation
import StateKit
import IGListDiffKit.IGListDiffable
import RxExtensions

extension ObjectsList: StatefullView {
  
  public func bind(store: ObjectsListState) {
    let state = store.state.distinctUntilChanged().share()
    
    let source = RxListAdapterDataSource<ObjectsSections>(sectionControllerProvider: { _, section in
      switch section {
      case .header:
        return ListHeaderSectionController()
      case .empty:
        return EmptyListSectionController()
      case .listHeaderSkeleton:
        return ListHeaderSkeletonSectionController()
      case .skeleton:
        return ObjectsListSkeletonSectionController()
      case .objects:
        return ObjectsSectionController()
      }
    })
    
    rx
      .viewWillAppear
      .map { _ in ObjectsListState.Action.fetchObjects }
      .bind(to: store.action)
      .disposed(by: disposeBag)
    
    specializedView
      .refreshControl
      .rx
      .controlEvent(.valueChanged)
      .debounce(.milliseconds(300), scheduler: MainScheduler.instance)
      .map { ObjectsListState.Action.refreshMyObjects }
      .bind(to: store.action)
      .disposed(by: disposeBag)
    
    let skeleton = state
      .filter { $0.initialLoading == true }
      .map { _ in [
        ListHeaderSkeletonViewModel(id: 0),
        ListSkeletonViewModel(id: 1),
        ListSkeletonViewModel(id: 2),
        ListSkeletonViewModel(id: 3),
        ListSkeletonViewModel(id: 4)
        ]}
      .map { $0.mapToObjectsSections() }
    
    let empty = state
      .filter { $0.initialLoading == false && $0.objects.isEmpty }
      .map { _ in [
        EmptyListViewModel(title: "Empty", message: Localized.search, image: UIImage.Stub.specialists)
        ]}
      .map { $0.mapToObjectsSections() }
    
    let objects = state
      .filter { $0.initialLoading == false && !$0.objects.isEmpty }
      .map { $0.objects }
      .map { $0.map { $0.asViewModel() } }
      .map { [ListHeaderViewModel(count: 0, title: "Найдено \($0.count) объектов", icon: UIImage.ic_sort)] + $0 }
      .map { $0.mapToObjectsSections() }
    
    guard let adapter = specializedView.adapter else {
      return
    }
    
    Observable.of(
      skeleton,
      empty,
      objects
    )
      .merge()
      .bind(to: adapter.rx.objects(for: source))
      .disposed(by: disposeBag)
  }
}
