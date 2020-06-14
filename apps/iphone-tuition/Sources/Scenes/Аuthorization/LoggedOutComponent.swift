//
//  LoggedOutComponent.swift
//  AppLibrary
//
//  Created by nedstar on 26.05.2020.
//

import UIKit
import NeedleFoundation
import Foundation
import AuthUI

protocol LoggedOutBuilder {
  var loggedOutViewController: UIViewController { get }
}

class LoggedOutComponent: Component<EmptyDependency>, LoggedOutBuilder {
  var loggedOutViewController: UIViewController {
    UINavigationController(rootViewController: LoginViewController())
  }
}
