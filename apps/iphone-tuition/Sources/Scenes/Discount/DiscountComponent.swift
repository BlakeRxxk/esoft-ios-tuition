//
//  DiscountComponent.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import NeedleFoundation
import Foundation
import LoyaltyCore
import LoyaltyImplementation
import LoyaltyUI
import Network
import TuituionCore
import StorageKit

protocol DiscountBuilder {
  var viewController: UIViewController { get }
}

class DiscountComponent: Component<EmptyDependency>, DiscountBuilder {
  var useCase: LoyaltyUseCase {
    shared {
      LoyaltyUseCaseImplementation(loyaltyRepository: repository)
    }
  }

  var loyaltyStorage: LoyaltyStorage {
    let configuration = StorageConfiguration(type: .persistent)
    return LoyaltyStorageImplementation(inMemoryConfiguration: configuration)
  }

  var repository: LoyaltyRepository {
    shared {
      LoyaltyRepositoryImplementation(loyaltyGateway: gateway,
                                          loyaltyStorage: loyaltyStorage)
    }
  }

  var networkService: NetworkAPI {
    let service = NetworkAPI(session: .init(.shared),
                             decoder: RiesDecoder(),
                             baseUrl: URL(string: "https://us-central1-esoft-tuition-cloud.cloudfunctions.net")!)
    service.requestInterceptors.append(RiesInterceptor())

    return service
  }

  var gateway: LoyaltyGateway {
    shared {
      LoyaltyGatewayImplementation(networkService: networkService)
    }
  }

  var state: LoyaltyListState {
    LoyaltyListState(loyaltyUseCase: useCase)
  }

  var viewController: UIViewController {
    let viewController = DiscountViewController()
    viewController.store = state

    return viewController
  }
}
