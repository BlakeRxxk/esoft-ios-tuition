//
//  LoggedOutComponent.swift
//  AppLibrary
//
//  Created by nedstar on 26.05.2020.
//

import NeedleFoundation
import Foundation
import AuthCore
import AuthImplementation
import AuthUI
import Network
import TuituionCore
import StorageKit

protocol LoggedOutBuilder {
  var loggedOutViewController: UIViewController { get }
}

class LoggedOutComponent: Component<EmptyDependency>, LoggedOutBuilder {
  var networkService: NetworkAPI {
    shared {
      let service = NetworkAPI(session: .init(.shared),
                               decoder: RiesDecoder(),
                               baseUrl: URL(string: "https://us-central1-esoft-tuition-cloud.cloudfunctions.net/")!)
      service.requestInterceptors.append(RiesInterceptor())

      return service
    }
  }
  
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
