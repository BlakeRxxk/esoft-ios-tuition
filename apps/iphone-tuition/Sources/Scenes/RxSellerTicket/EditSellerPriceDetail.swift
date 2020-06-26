//
//  EditSellerPriceDetail.swift
//  AppLibrary
//
//  Created by wtildestar on 23/06/2020.
//

import NeedleFoundation
import Foundation
import UIKit
import SellerTicketCore
import SellerTicketUI

protocol EditSellerPriceDependency: Dependency {
  var useCase: SellerTicketUseCase { get }
}

protocol EditSellerPriceBuilder {
  var viewController: UIViewController { get }
}

class EditSellerPriceComponent: Component<EditSellerPriceDependency>, EditSellerPriceBuilder {
  var state: EditSellerPriceListState {
    EditSellerPriceListState(sellerTicketUseCase: dependency.useCase)
  }
  
  var viewController: UIViewController {
    let viewController = EditSellerPriceController()
    viewController.store = state

//    return UINavigationController(rootViewController: viewController)
    
    return viewController
  }
}
