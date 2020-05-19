//
//  LoggedOutComponent.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import UIKit
import NeedleFoundation
import Foundation

protocol LoggedOutBuilder {
  var loggedOutViewController: UIViewController { get }
}

class LoggedOutComponent: Component<EmptyDependency>, LoggedOutBuilder {
  
  var loggedOutViewController: UIViewController {
    UINavigationController(rootViewController: LoginViewController())
  }
}
