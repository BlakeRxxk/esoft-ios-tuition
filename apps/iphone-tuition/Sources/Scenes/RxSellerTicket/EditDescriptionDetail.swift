//
//  EditDescriptionDetail.swift
//  AppLibrary
//
//  Created by wtildestar on 25/06/2020.
//

import NeedleFoundation
import Foundation
import UIKit
import SellerTicketCore
import SellerTicketUI

protocol EditDescriptionDependency: Dependency {
  var useCase: SellerTicketUseCase { get }
}

protocol EditDescriptionBuilder {
  var viewController: UIViewController { get }
}

class EditDescriptionComponent: Component<EditDescriptionDependency>, EditDescriptionBuilder {
  var state: EditDescriptionControllerState {
    EditDescriptionControllerState(sellerTicketUseCase: dependency.useCase)
  }
  
  var viewController: UIViewController {
    let viewController = EditDescriptionController()
    viewController.store = state

//    return UINavigationController(rootViewController: viewController)
    
    return viewController
  }
}
