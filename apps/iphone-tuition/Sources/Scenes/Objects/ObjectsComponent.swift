//
//  ObjectsComponent.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import NeedleFoundation
import Foundation
import ObjectsCore
import ObjectsImplementation
import ObjectsUI
import Network
import TuituionCore

protocol ObjectsBuilder {
  var viewController: UIViewController { get }
}

class ObjectsComponent: Component<EmptyDependency>, ObjectsBuilder {
  var useCase: ObjectsUseCase {
    shared {
      ObjectsUseCaseImplementation(objectsRepository: repository)
    }
  }
  
  var repository: ObjectsRepository {
    shared {
      ObjectsRepositoryImplementation(objectsGateway: gateway)
    }
  }
  
  var networkService: NetworkAPI {
     let service = NetworkAPI(session: .init(.shared),
                              decoder: RiesDecoder(),
                              baseUrl: URL(string: "https://us-central1-esoft-tuition-cloud.cloudfunctions.net/objects")!)
     service.requestInterceptors.append(RiesInterceptor())

     return service
   }
  
  var gateway: ObjectsGateway {
    shared {
      ObjectsGatewayImplementation(networkService: networkService)
    }
  }
  
  var state: ObjectsListState {
    ObjectsListState(objectsUseCase: useCase)
  }
  
  var viewController: UIViewController {
    let viewController = ObjectsList()
    viewController.store = state
    
    return viewController
  }
}
