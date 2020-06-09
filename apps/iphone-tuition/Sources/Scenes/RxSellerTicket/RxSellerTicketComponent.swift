//
//  RxSellerTicketComponent.swift
//  AppLibrary
//
//  Created by wtildestar on 23/05/2020.
//

import NeedleFoundation
import Foundation
import SellerTicketCore
import SellerTicketImplementation
import SellerTicketUI
import Network
import TuituionCore

protocol RxSellerTicketBuilder {
  var sellerTicketViewController: UIViewController { get }
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
  
  var networkService: NetworkAPI {
    let service = NetworkAPI(session: .init(.shared),
                             decoder: RiesDecoder(),
                             baseUrl: URL(string: "https://us-central1-esoft-tuition-cloud.cloudfunctions.net/sellerTicket")!)
    service.requestInterceptors.append(RiesInterceptor())
    
    return service
  }
  
  var gateway: SellerTicketGateway {
    shared {
      SellerTicketGatewayImplementation(networkService: networkService)
    }
  }
  
  var state: SellerTicketListState {
    SellerTicketListState(sellerTicketUseCase: useCase)
  }
  
  var sellerTicketViewController: UIViewController {
    let viewController = SellerTicketList()
    viewController.store = state
    
    return viewController
  }
}

