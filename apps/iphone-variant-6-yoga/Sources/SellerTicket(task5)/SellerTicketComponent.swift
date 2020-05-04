//
//  SellerTicketComponent.swift
//  AppLibrary
//
//  Created by Blake Rxxk on 02.05.2020.
//

import NeedleFoundation
import Foundation

protocol SellerTicketBuilder {
  var sellerTicketViewController: UIViewController { get }
}

class SellerTicketComponent: Component<EmptyDependency>, SellerTicketBuilder {
  
  var sellerTicketViewController: UIViewController {
    SellerTicketViewController()
  }
}
