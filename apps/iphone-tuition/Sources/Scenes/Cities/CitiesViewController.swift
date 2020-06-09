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
import ListKit

public final class CitiesViewController: ViewController<BaseListView> {
  let presenter: CitiesPresenter
  
  var data: [CityViewModel] = []
  
  init(presenter: CitiesPresenter) {
    self.presenter = presenter
    
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
    presenter.loadCities { [unowned self] viewModesl in
      self.data.append(contentsOf: viewModesl)

      DispatchQueue.main.async { [unowned self] in
        self.specializedView.adapter?.performUpdates(animated: true)
        self.specializedView.refreshControl.endRefreshing()
      }
    }
  }
  
  private func configureUI() {
    specializedView.adapter?.dataSource = self
    specializedView.adapter?.scrollViewDelegate = self
    view.backgroundColor = AppTheme.current().colors.container
    specializedView.refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
  }
  
  @objc func refresh(_ sender: AnyObject) {
    print("refresh")
    presenter.showDetails()
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
