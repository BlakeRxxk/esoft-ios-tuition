//
//  SpecialistsComponent.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import NeedleFoundation
import Foundation
import SpecialistsCore
import SpecialistsImplementation
import SpecialistsUI
import Network
import TuituionCore
import StorageKit

protocol SpecialistsDependency: Dependency {
  var rootNavigator: UINavigationController { get }
  var networkService: NetworkAPIProtocol { get }
}

protocol SpecialistsBuilder {
  var viewController: UIViewController { get }
}

class SpecialistsComponent: Component<SpecialistsDependency>, SpecialistsBuilder {
  var useCase: SpecialistsUseCase {
    shared {
      SpecialistsUseCaseImplementation(specialistRepository: repository)
    }
  }
  
  var specialistsStorage: SpecialistsStorage {
    let configuration = StorageConfiguration(type: .inmemory)
    return SpecialistsStorageImplementation(inMemoryConfiguration: configuration)
  }
  
  var repository: SpecialistsRepository {
    shared {
      SpecialistsRepositoryImplementation(specialistGateway: gateway,
                                          specialistsStorage: specialistsStorage)
    }
  }
  
  var networkService: NetworkAPI {
    let service = NetworkAPI(session: .init(.shared),
                             decoder: RiesDecoder(),
                             baseUrl: URL(string: "https://developers.etagi.com/api/v2/catalogs")!)
    service.requestInterceptors.append(RiesInterceptor())

    return service
  }
  
  var gateway: SpecialistsGateway {
    shared {
      SpecialistsGatewayImplementation(networkService: dependency.networkService)
    }
  }
  
  var state: SpecialistsListState {
    
    SpecialistsListState(specialistsUseCase: useCase)
  }

  var router: SpecialistsRouter {
    shared {
      let router = SpecialistsRouterImplementation(detailsBuilder: details)
      router.setViewController(dependency.rootNavigator)
      return router
    }
  }
  
  var viewController: UIViewController {
    
    list.viewController
  }
  
  var list: SpecialistsListComponent {
    SpecialistsListComponent(parent: self)
  }
  
  var details: SpecialistDetailsComponent {
    SpecialistDetailsComponent(parent: self)
  }
}
