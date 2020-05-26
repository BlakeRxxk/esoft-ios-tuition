//
//  Empty.swift
//  AppLibrary
//
//  Created by nedstar on 20.05.2020.
//

import UIKit
import NeedleFoundation
import Foundation

protocol AuthCitiesBuilder{
  var authCitiesViewController: UIViewController { get }
}

class AuthCitiesComponent: Component<EmptyDependency>, AuthCitiesBuilder {
  var authCitiesViewController: UIViewController {
    UINavigationController(rootViewController: AuthCitiesViewController())
  }
}
