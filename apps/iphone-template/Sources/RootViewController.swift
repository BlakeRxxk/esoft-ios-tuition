//
//  RootViewController.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import UIKit
import EsoftUIKit
import BaseUI
import IGListKit
import YogaKit
import NetworkTrainee

public final class RootViewController: ViewController<BaseListView> {
  internal var data: [ListDiffable] = [
    RootViewItemViewModel(id: 1, name: "Task 1"),
    RootViewItemViewModel(id: 2, name: "Task 2"),
    RootViewItemViewModel(id: 3, name: "Task 3"),
    RootViewItemViewModel(id: 4, name: "Task 4"),
    RootViewItemViewModel(id: 5, name: "Task 5"),
    RootViewItemViewModel(id: 6, name: "Task 6")
  ]

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
    specializedView.adapter?.dataSource = self
    view.backgroundColor = AppTheme.current().colors.container
  }
}

extension RootViewController: ListAdapterDataSource {
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


public final class RootViewItemViewModel {
  let id: Int
  let name: String
  
  public init(id: Int, name: String) {
    self.id = id
    self.name = name
  }
}

extension RootViewItemViewModel: ListDiffable {
  public func diffIdentifier() -> NSObjectProtocol {
    id as NSObjectProtocol
  }
  
  public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    guard self !== object else { return true }
    guard let object = object as? RootViewItemViewModel else { return false }
    return id == object.id && name == object.name
  }
}

extension RootViewItemViewModel: Equatable {
  public static func == (lhs: RootViewItemViewModel, rhs: RootViewItemViewModel) -> Bool {
    lhs.id == rhs.id
  }
}
