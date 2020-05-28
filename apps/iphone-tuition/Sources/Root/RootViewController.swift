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

public final class RootViewController: ViewController<BaseListView> {
  internal var data: [ListDiffable] = [
    RootViewItemViewModel(id: 1, name: "Task 1"),
    RootViewItemViewModel(id: 2, name: "Task 2"),
    RootViewItemViewModel(id: 3, name: "Task 3"),
    RootViewItemViewModel(id: 4, name: "Task 4"),
    RootViewItemViewModel(id: 5, name: "Task 5"),
    RootViewItemViewModel(id: 6, name: "Task 6"),
    RootViewItemViewModel(id: 7, name: "Cities"),
    RootViewItemViewModel(id: 8, name: "Simple RxDemo")
  ]
  
  private var objectsBuilder: ObjectsBuilder
  private var sellerTicketBuilder: SellerTicketBuilder
  private var discountBuilder: DiscountBuilder
  private var mortgageBuilder: MortgageBuilder
  private var loggedOutBuilder: LoggedOutBuilder
  private var rxdemoBuilder: SpecialistsBuilder
  private var citiesBuilder: CitiesBuilder
  private var rxdemoBuilder: SpecialistsBuilder
  
  init(objectsBuilder: ObjectsBuilder,
       sellerTicketBuilder: SellerTicketBuilder,
       discountBuilder: DiscountBuilder,
       mortgageBuilder: MortgageBuilder,
       loggedOutBuilder: LoggedOutBuilder,
       citiesBuilder: CitiesBuilder,
       rxdemoBuilder: SpecialistsBuilder) {
    self.objectsBuilder = objectsBuilder
    self.sellerTicketBuilder = sellerTicketBuilder
    self.discountBuilder = discountBuilder
    self.mortgageBuilder = mortgageBuilder
    self.loggedOutBuilder = loggedOutBuilder
    self.rxdemoBuilder = rxdemoBuilder
    self.citiesBuilder = citiesBuilder
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
    RootViewItemSectionController(output: self)
  }
  
  public func emptyView(for listAdapter: ListAdapter) -> UIView? {
    nil
  }
}

extension RootViewController: RootViewItemSectionOutput {
  public func didTapAction(in cell: RootViewItemInput) {
    switch cell.name {
    case "Task 2":
      show(discountBuilder.discountViewController, sender: nil)
    case "Task 3":
      show(objectsBuilder.objectsViewController, sender: nil)
    case "Task 4":
      show(mortgageBuilder.mortgageListViewController, sender: nil)
    case "Task 5":
      show(sellerTicketBuilder.sellerTicketViewController, sender: nil)
    case "Task 6":
      present(loggedOutBuilder.loggedOutViewController, animated: true)
    case "Cities":
      let scene = ViperModule.buildModule()
      show(scene, sender: nil)
    case "Simple RxDemo":
      show(rxdemoBuilder.viewController, sender: nil)
    default:
      return
    }
  }
}
