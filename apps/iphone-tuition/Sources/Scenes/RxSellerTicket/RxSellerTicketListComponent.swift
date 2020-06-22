//
//  RxSellerTicketListComponent.swift
//  AppLibrary
//
//  Created by wtildestar on 19/06/2020.
//

import NeedleFoundation
import Foundation
import UIKit
import SellerTicketCore
import SellerTicketUI

protocol SellerTicketListDependency: Dependency {
  var useCase: SellerTicketUseCase { get }
  var router: SellerTicketRouter { get }
}

protocol SellerTicketListBuilder {
  var viewController: UIViewController { get }
}

class SellerTicketListComponent: Component<SellerTicketListDependency>, SellerTicketListBuilder {
  var state: SellerTicketListState {
    SellerTicketListState(sellerTicketUseCase: dependency.useCase)
  }

  var viewController: UIViewController {
    let viewController = SellerTicketList()
    viewController.store = state
    viewController.router = dependency.router

    return viewController
  }
}
