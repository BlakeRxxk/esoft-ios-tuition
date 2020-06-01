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
import SpecialistsUI

protocol SpecialistsBuilder {
  var viewController: UIViewController { get }
}

class SpecialistsComponent: Component<EmptyDependency>, SpecialistsBuilder {
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
  
  var state: SpecialistsListState {
    SpecialistsListState(useCase: self.useCase)
  }
  
  var viewController: UIViewController {
    let viewController = SpecialistsList()
    viewController.store = state
    
    return viewController
  }
}
