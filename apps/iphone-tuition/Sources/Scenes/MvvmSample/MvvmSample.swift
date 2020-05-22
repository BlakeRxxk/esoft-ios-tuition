//
//  MvvmSample.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation
import BaseUI
import EsoftUIKit
import YogaKit
import RxSwift
import RxCocoa
import ListKit
import SpecialistsUI

public final class MvvmSample: ViewController<BaseListView> {
  let disposeBag = DisposeBag()
  let viewModel: ViewModel

  init(viewModel: ViewModel) {
    self.viewModel = viewModel
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

extension MvvmSample {
  func bind() {
    guard let adapter = specializedView.adapter else {
      return
    }

    UIApplication
    .shared
    .rx
    .applicationWillEnterForeground
    .asDriver(onErrorJustReturn: .active)
    .drive(onNext: { [unowned self] _ in
      self.specializedView.reloadContent()
    })
    .disposed(by: disposeBag)
    
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
  
    let endRefresh = specializedView.refreshControl.rx.isRefreshing
    
    rx
      .viewWillAppear
      .map { _ in () }
      .bind(to: viewModel.loadSpecialists)
      .disposed(by: disposeBag)

    specializedView
      .refreshControl
      .rx
      .controlEvent(.valueChanged)
//      .debounce(.milliseconds(300), scheduler: MainScheduler.instance)
      .bind(to: viewModel.refresh)
      .disposed(by: disposeBag)
    
    viewModel
      .specialists
      .do(onNext: { _ in endRefresh.onNext(false) })
      .map { $0.mapToSpecialistsSections() }
      .bind(to: adapter.rx.objects(for: source))
      .disposed(by: disposeBag)
  }
}
