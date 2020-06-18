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

class PasswordComponent: Component<EmptyDependency>, PasswordBuilder {
  var networkService: NetworkAPI {
    let service = NetworkAPI(session: .init(.shared),
                             decoder: RiesDecoder(),
                             baseUrl: URL(string: "https://us-central1-esoft-tuition-cloud.cloudfunctions.net/")!)
    service.requestInterceptors.append(RiesInterceptor())

    return service
  }
  
  var passwordGateway: PasswordGateway {
    shared {
      PasswordGatewayImplementation(networkService: networkService)
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
