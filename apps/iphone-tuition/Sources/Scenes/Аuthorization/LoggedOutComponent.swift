//
//  LoggedOutComponent.swift
//  AppLibrary
//
//  Created by nedstar on 26.05.2020.
//

import NeedleFoundation
import Foundation
import AuthUI
import AuthImplementation

protocol LoggedOutBuilder {
  var loggedOutViewController: UIViewController { get }
}

class LoggedOutComponent: Component<EmptyDependency>, LoggedOutBuilder {
  var state: LoginState {
    LoginState()
  }
  
  var loggedOutViewController: UIViewController {
    let loginViewController = LoginViewController(passwordBuilder: passwordComponent)
    loginViewController.store = state
    
    return UINavigationController(rootViewController: loginViewController)
  }
  
  var passwordComponent: PasswordComponent {
    PasswordComponent(parent: self)
  }
}
