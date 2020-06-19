//
//  PasswordComponent.swift
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

protocol networkServiceDependency: Dependency {
  var networkService: NetworkAPI { get }
}

class PasswordComponent: Component<networkServiceDependency>, PasswordBuilder {
  var passwordGateway: PasswordGateway {
    shared {
      PasswordGatewayImplementation(networkService: dependency.networkService)
    }
  }
  
  var passwordRepository: PasswordRepository {
    shared {
      PasswordRepositoryImplementation(passwordGateway: passwordGateway)
    }
  }
  
  var passwordUseCase: PasswordUseCase {
    shared {
      PasswordUseCaseImplementation(passwordRepository: passwordRepository)
    }
  }
  
  var state: PasswordState {
    PasswordState(passwordUseCase: passwordUseCase)
  }
  
  var authCitiesComponent: AuthCitiesComponent {
    AuthCitiesComponent(parent: self)
  }
  
  var passwordViewController: UIViewController {
    let viewController = PasswordViewController(authCitiesComponent)
    viewController.store = state
    
    return UINavigationController(rootViewController: viewController)
  }
}
