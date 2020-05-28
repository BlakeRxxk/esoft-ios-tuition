//
//  ViperViewController.swift
//  AppLibrary
//
//  Created by Blake Rxxk on 25.05.2020.
//

import Foundation
import UIKit
import EsoftUIKit
import BaseUI
import IGListKit
import YogaKit
import ListKit

public final class ViperViewController: ViewController<BaseListView> {
  var presenter: ViperPresenter

  var data: [CityViewModel] = []
  
  init(presenter: ViperPresenter) {
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
    presenter.loadCities { [unowned self] cities in
      self.data.append(contentsOf: cities)
      
      DispatchQueue.main.async { [unowned self] in
        self.specializedView.adapter?.performUpdates(animated: true)
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
    presenter.showDetail()
  }
}

extension ViperViewController: ListAdapterDataSource {
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

extension ViperViewController: UIScrollViewDelegate {
  public func scrollViewWillEndDragging(_ scrollView: UIScrollView,
                                        withVelocity velocity: CGPoint,
                                        targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    let distance = scrollView.contentSize.height - (targetContentOffset.pointee.y + scrollView.bounds.height)
    
    if distance < 300 {
      // put your updating code here
    }
  }
}
