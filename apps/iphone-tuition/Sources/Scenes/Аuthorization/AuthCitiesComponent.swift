//
//  АuthCitiesComponent.swift
//  AppLibrary
//
//  Created by nedstar on 26.05.2020.
//

import UIKit
import NeedleFoundation
import Foundation
import Authorization

protocol AuthCitiesBuilder {
  var authCitiesViewController: UIViewController { get }
}

class AuthCitiesComponent: Component<EmptyDependency>, AuthCitiesBuilder {
  var authCitiesViewController: UIViewController {
    let viewController = Authorization.CitiesViewController()
    viewController.store = CitiesViewControllerState()
    
    return UINavigationController(rootViewController: viewController)
  }
}
