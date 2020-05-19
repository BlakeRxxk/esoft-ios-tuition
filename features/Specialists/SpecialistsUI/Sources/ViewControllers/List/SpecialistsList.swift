//
//  SpecialistsList.swift
//  SpecialistsUI
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation
import BaseUI
import EsoftUIKit
import RxSwift
import YogaKit
import ThemeManager
import ListKit
import Localized
import SpecialistsImplementation
import StateKit

public final class SpecialistsList: ViewController<BaseListView> {
  public var disposeBag: DisposeBag = DisposeBag()
  
  let objectSignal: BehaviorSubject<[SpecialistsSections]> = BehaviorSubject<[SpecialistsSections]>(value: [])
  
  public init() {
    super.init(viewCreator: BaseListView.init)
    
    configureUI()
  }
  
  override public func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    let container = view.bounds.size
    view.configureLayout { layout in
      layout.isEnabled = true
      layout.width = YGValue(container.width)
      layout.height = YGValue(container.height)
    }
    
    specializedView.configureLayout { layout in
      layout.isEnabled = true
      layout.width = YGValue(container.width)
      layout.height = YGValue(container.height)
    }
    view.yoga.applyLayout(preservingOrigin: true)
  }
  
  override public func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    store?.action.onNext(.refreshMySpecialists)
    store?.action.onNext(.refreshMySpecialists)
    store?.action.onNext(.refreshMySpecialists)
    store?.action.onNext(.refreshMySpecialists)
  }
  
  private func configureUI() {
    view.backgroundColor = ThemeManager.current().colors.container
    specializedView.collectionView.backgroundColor = ThemeManager.current().colors.screen
  }
}

extension SpecialistsList: StatefullView {
  public func bind(store: SpecialistsListState) {
    
    store
      .state
      .distinctUntilChanged()
      .map { $0.initialLoading }
      .debug()
      .asDriver(onErrorJustReturn: false)
      .drive()
      .disposed(by: disposeBag)
  }
}

//extension SpecialistsList {
//  func bind() {
//    let source = RxListAdapterDataSource<SpecialistsSections>(sectionControllerProvider: { _, section in
//      switch section {
//      case .header:
//        return ListHeaderSectionController()
//      case .empty:
//        return EmptyListSectionController()
//      case .listHeaderSkeleton:
//        return ListHeaderSkeletonSectionController()
//      case .skeleton:
//        return SpecialistsListSkeletonSectionController()
//      case .specialists:
//        return SpecialistsSectionController()
//      }
//    })
//
//    guard let adapter = specializedView.adapter else {
//      return
//    }
//
//    objectSignal
//      .bind(to: adapter.rx.objects(for: source))
//      .disposed(by: disposeBag)
//
//    objectSignal.onNext(showSkeleton())
////
////        let networkRequest = networkAPI
////          .getSpecialists(url: URL(string: "https://developers.etagi.com/api/v2/staff?&api_key=demo_lk_ios")!)
////          .share()
////
////        networkRequest
////          .elements()
////          .compactMap { $0.data }
////          .map { $0.map { $0.asViewModel() } }
////          .map { $0.mapToSpecialistsSections() }
////          .bind(to: adapter.rx.objects(for: source))
////          .disposed(by: disposeBag)
//  }
//
//  func showSkeleton() -> [SpecialistsSections] {
//    [
//      ListHeaderSkeletonViewModel(id: 0),
//      ListSkeletonViewModel(id: 1),
//      ListSkeletonViewModel(id: 2),
//      ListSkeletonViewModel(id: 3),
//      ListSkeletonViewModel(id: 4),
//      ListSkeletonViewModel(id: 5)
//      ].mapToSpecialistsSections()
//  }
//
//  func showEmpty() -> [SpecialistsSections] {
//    [
//      EmptyListViewModel(title: "Empty", message: Localized.search, image: UIImage.Stub.specialists)
//      ].mapToSpecialistsSections()
//  }
//}

extension SpecialistsList {
  enum Localized {
    public static let search = "search".localize()
  }
}
