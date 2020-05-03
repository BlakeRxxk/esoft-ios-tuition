//
//  MortgageComponent.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import NeedleFoundation
import Foundation

protocol MortgageBuilder {
  var mortgageListViewController: UIViewController { get }
}

class MortgageComponent: Component<EmptyDependency>, MortgageBuilder {
  
  var mortgageListViewController: UIViewController {
    MortgageListViewController()
  }
}
