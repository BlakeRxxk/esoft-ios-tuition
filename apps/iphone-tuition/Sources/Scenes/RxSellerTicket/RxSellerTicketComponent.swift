//
//  RxSellerTicketComponent.swift
//  AppLibrary
//
//  Created by wtildestar on 23/05/2020.
//

import NeedleFoundation
import Foundation
import SpecialistsCore
import SpecialistsImplementation
import SpecialistsUI

protocol RxSellerTicketBuilder {
  var viewController: UIViewController { get }
}

class RxSellerTicketComponent: Component<EmptyDependency>, RxSellerTicketBuilder {
  var useCase: SellerTicketUseCase {
    shared {
      SellerTicketUseCaseImplementation(sellerTicketRepository: repository)
    }
  }
  
  var repository: SellerTicketRepository {
    shared {
      SellerTicketRepositoryImplementation(sellerTicketGateway: gateway)
    }
  }
  
  var gateway: SellerTicketGateway {
    shared {
      SellerTicketGatewayImplementation(session: .init(.shared), baseUrl: URL(string: "https://developers.etagi.com/api/v2/catalogs")!)
    }
  }
  
  var state: SellerTicketListState {
    SellerTicketListState()
  }
  
  var viewController: UIViewController {
    let viewController = SellerTicketList()
    viewController.store = state
    
    return viewController
  }
}

