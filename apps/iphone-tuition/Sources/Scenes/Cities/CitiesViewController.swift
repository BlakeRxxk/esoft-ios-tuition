//
//  CitiesViewController.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation
import UIKit
import EsoftUIKit
import BaseUI
import IGListKit
import YogaKit
import NetworkTrainee

public final class CitiesViewController: ViewController<BaseListView> {
  var networkManager = NetworkManager()

  var data: [CityViewModel] = []

  init() {
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
    
    networkManager.getCilies(page: 1) { [unowned self] (res, _) in
      guard let cities = res else { return }
      
      let tmp = cities.map { CityViewModel(id: $0.id, name: $0.name) }
      self.data.append(contentsOf: tmp)
      
      DispatchQueue.main.async {
        self.specializedView.adapter?.performUpdates(animated: true)
      }
    }
  }

  private func configureUI() {
    specializedView.adapter?.dataSource = self
    specializedView.adapter?.scrollViewDelegate = self
    view.backgroundColor = AppTheme.current().colors.container
  }
}

extension CitiesViewController: ListAdapterDataSource {
  public func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
    data as [ListDiffable]
  }
  
  public func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
    CitiesSectionController()
  }
  
  public func emptyView(for listAdapter: ListAdapter) -> UIView? {
    nil
  }
}

extension CitiesViewController: UIScrollViewDelegate {
  public func scrollViewWillEndDragging(_ scrollView: UIScrollView,
                                        withVelocity velocity: CGPoint,
                                        targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    let distance = scrollView.contentSize.height - (targetContentOffset.pointee.y + scrollView.bounds.height)
    
    if distance < 300 {
      // put your updating code here
    }
  }
}
