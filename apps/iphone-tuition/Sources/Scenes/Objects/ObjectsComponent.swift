//
//  ObjectsComponent.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

//import NeedleFoundation
//import Foundation
//
//protocol ObjectsBuilder {
//  var objectsViewController: UIViewController { get }
//}
//
//class ObjectsComponent: Component<EmptyDependency>, ObjectsBuilder {
//
//  var objectsViewController: UIViewController {
//    ObjectsViewController()
//  }
//}


import NeedleFoundation
import Foundation
import ObjectsCore
import ObjectsImplementation
import ObjectsUI

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
  
  var gateway: ObjectsGateway {
    shared {
        ObjectsGatewayImplementation(session: .init(.shared), baseUrl: URL(string: "https://us-central1-esoft-tuition-cloud.cloudfunctions.net/objects")!)
    }
  }
  
  var state: ObjectsListState {
    ObjectsListState()
  }
  
  var viewController: UIViewController {
    let viewController = ObjectsList ()
    viewController.store = state
    
    return viewController
  }
}
