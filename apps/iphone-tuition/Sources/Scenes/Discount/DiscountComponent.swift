//
//  DiscountComponent.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import NeedleFoundation
import Foundation

protocol DiscountBuilder {
  var discountViewController: UIViewController { get }
}

class DiscountComponent: Component<EmptyDependency>, DiscountBuilder {
  
  var discountViewController: UIViewController {
    DiscountViewController()
  }
}
