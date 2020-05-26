//
//  PasswordComponent.swift
//  AppLibrary
//
//  Created by nedstar on 26.05.2020.
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

