//
//  RxDemoComponent.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import NeedleFoundation
import Foundation
import SpecialistsCore
import SpecialistsImplementation

protocol RxDemoBuilder {
  var viewController: UIViewController { get }
}

class RxDemoComponent: Component<EmptyDependency>, RxDemoBuilder {
  var useCase: SpecialistsUseCase {
    shared {
      SpecialistsUseCaseImplementation(specialistRepository: repository)
    }
  }
  
  var repository: SpecialistsRepository {
    shared {
      SpecialistsRepositoryImplementation(specialistGateway: gateway)
    }
  }
  
  var gateway: SpecialistsGateway {
    shared {
      SpecialistsGatewayImplementation(session: .init(.shared), baseUrl: URL(string: "https://developers.etagi.com/api/v2/catalogs")!)
    }
  }
  
  var viewController: UIViewController {
    RxDemoViewController()
  }
}
