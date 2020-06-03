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

protocol SpecialistsBuilder {
  var viewController: UIViewController { get }
}

class SpecialistsComponent: Component<EmptyDependency>, SpecialistsBuilder {
  var useCase: SpecialistsUseCase {
    shared {
      SpecialistsUseCaseImplementation(specialistRepository: repository)
    }
  }
  
  var specialistsStorage: SpecialistsStorage {
    let configuration = StorageConfiguration(type: .persistent)
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
      SpecialistsGatewayImplementation(networkService: networkService)
    }
  }
  
  var state: SpecialistsListState {
    SpecialistsListState(specialistsUseCase: useCase)
  }
  
  var viewController: UIViewController {
    let viewController = SpecialistsList()
    viewController.store = state
    
    return viewController
  }
}
