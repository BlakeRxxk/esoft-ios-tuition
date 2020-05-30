//
//  CitiesRouter.swift
//  AppLibrary
//
//  Created by Blake Rxxk on 25.05.2020.
//

import Foundation
import UIKit

class CitiesRouterImplementation {
  var presentingViewController: UIViewController?
}

protocol CitiesRouter {
  func showDetail()
  func presentingViewController(presentingViewController: UIViewController)
}

extension CitiesRouterImplementation: CitiesRouter {

  func presentingViewController(presentingViewController: UIViewController) {
    self.presentingViewController = presentingViewController
  }

  func showDetail() {
    let test = UIViewController()
    test.view.backgroundColor = .red
    presentingViewController?.present(test, animated: true)
  }
}
