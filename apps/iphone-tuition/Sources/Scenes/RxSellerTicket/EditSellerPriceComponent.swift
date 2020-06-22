//
//  EditSellerPriceComponent.swift
//  AppLibrary
//
//  Created by wtildestar on 22/06/2020.
//

import NeedleFoundation
import Foundation
import UIKit
import SellerTicketCore
import SellerTicketUI

protocol EditSellerPriceDependency: Dependency {
  var useCase: EditSellerPriceUseCase { get }
}

protocol EditSellerPriceBuilder {
  var viewController: UIViewController { get }
}

class EditSellerPriceComponent: Component<EditSellerPriceDependency>, EditSellerPriceBuilder {
  var state: EditSellerPriceListState {
    EditSellerPriceListState(editSellerPriceUseCase: dependency.useCase)
  }
  
  var viewController: UIViewController {
    let viewController = EditSellerPriceList()
    viewController.store = state

    return viewController
  }
}
