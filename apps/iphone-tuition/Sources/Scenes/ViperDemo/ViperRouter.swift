//
//  ViperRouter.swift
//  AppLibrary
//
//  Created by Blake Rxxk on 25.05.2020.
//

import Foundation
import UIKit

final class ViperRouterImplementation: ViperRouter {
  var presentingView: UIViewController?
  
  init() {}

  func showDetail() {
    let test = UIViewController()
    test.view.backgroundColor = .systemTeal
    
    presentingView?.show(test, sender: nil)
  }
}

protocol ViperRouter: AnyObject {
  func showDetail()
}
