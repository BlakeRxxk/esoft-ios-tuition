//
//  LoggedOutComponent.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import UIKit
import NeedleFoundation
import Foundation

protocol PasswordBuilder {
  var passwordViewController: UIViewController { get }
}

class PasswordComponent: Component<EmptyDependency>, PasswordBuilder {
  
  var passwordViewController: UIViewController {
    UINavigationController(rootViewController: PasswordViewController())
  }
}
