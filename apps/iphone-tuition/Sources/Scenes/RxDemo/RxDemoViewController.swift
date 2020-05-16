//
//  RxDemoViewController.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import YogaKit
import Network
import BaseUI
import EsoftUIKit
import ListKit
import Localized
import SpecialistsUI

final class RxDemoViewController: ViewController<BaseListView> {
  private let disposeBag: DisposeBag = DisposeBag()
  private let networkAPI = CatalogsAPI(session: .init(.shared),
                                       baseUrl: URL(string: "https://developers.etagi.com/api/v2/catalogs")!)
  
  let objectSignal: BehaviorSubject<[SpecialistsSections]> = BehaviorSubject<[SpecialistsSections]>(value: [])
  
  init() {
    super.init(viewCreator: BaseListView.init)
    
    configureUI()
    bind()
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
  
  private func configureUI() {
    view.backgroundColor = AppTheme.current().colors.container
    specializedView.collectionView.backgroundColor = AppTheme.current().colors.screen
  }
}

extension RxDemoViewController {
  func bind() {
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
    
    guard let adapter = specializedView.adapter else {
      return
    }
    
    objectSignal
      .bind(to: adapter.rx.objects(for: source))
      .disposed(by: disposeBag)
    
        let networkRequest = networkAPI
          .getSpecialists(url: URL(string: "https://developers.etagi.com/api/v2/staff?&api_key=demo_lk_ios")!)
          .share()
    
//    objectSignal.onNext(showSkeleton())
        networkRequest
          .elements()
          .compactMap { $0.data }
          .map { $0.map { $0.asViewModel() } }
          .map { $0.mapToSpecialistsSections() }
          .bind(to: adapter.rx.objects(for: source))
          .disposed(by: disposeBag)
  }
  
  func showSkeleton() -> [SpecialistsSections] {
    [
      ListHeaderSkeletonViewModel(id: 0),
      ListSkeletonViewModel(id: 1),
      ListSkeletonViewModel(id: 2),
      ListSkeletonViewModel(id: 3),
      ListSkeletonViewModel(id: 4),
      ListSkeletonViewModel(id: 5)
      ].mapToSpecialistsSections()
  }
  
  func showEmpty() -> [SpecialistsSections] {
    [
      EmptyListViewModel(title: "Empty", message: Localized.search, image: UIImage.Stub.specialists)
      ].mapToSpecialistsSections()
  }
}

extension RxDemoViewController {
  enum Localized {
    public static let search = "search".localize()
  }
}

extension RxDemoViewController: SpecialistsSectionControllerOutput {
  func didTapPhone(in cell: SpecialistCellInput) {
    print("did tap phone")
  }
  
  func didTapChat(in cell: SpecialistCellInput) {
    print("did tap chat")
  }
  
  func didTapSpecialist(in cell: SpecialistCellInput) {
    print("did tap")
  }
}
