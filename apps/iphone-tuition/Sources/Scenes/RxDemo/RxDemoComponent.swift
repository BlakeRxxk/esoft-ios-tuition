//
//  RxDemoComponent.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import NeedleFoundation
import Foundation

protocol RxDemoBuilder {
  var viewController: UIViewController { get }
}

class RxDemoComponent: Component<EmptyDependency>, RxDemoBuilder {
  
  var viewController: UIViewController {
    RxDemoViewController()
  }
}
