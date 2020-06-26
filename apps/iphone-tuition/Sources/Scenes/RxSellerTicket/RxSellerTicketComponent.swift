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

protocol RxSellerTicketDependency: Dependency {
  var rootNavigator: UINavigationController { get }
  var networkService: NetworkAPIProtocol { get }
}

protocol RxSellerTicketBuilder {
  var viewController: UIViewController { get }
}

class RxSellerTicketComponent: Component<RxSellerTicketDependency>, RxSellerTicketBuilder {
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
  
//  var networkService: NetworkAPI {
//    let service = NetworkAPI(session: .init(.shared),
//                             decoder: RiesDecoder(),
//                             baseUrl: URL(string: "https://us-central1-esoft-tuition-cloud.cloudfunctions.net/sellerTicket")!)
//    service.requestInterceptors.append(RiesInterceptor())
//
//    return service
//  }
  
  var gateway: SellerTicketGateway {
    shared {
      SellerTicketGatewayImplementation(networkService: dependency.networkService)
    }
  }
  
  var router: SellerTicketRouter {
    shared {
      let router = SellerTicketRouterImplementation(detailsBuilder: editSellerPrice, editDescriptionBuilder: editDescription)
      router.setViewController(dependency.rootNavigator)
      return router
    }
  }
  
  var state: SellerTicketListState {
    SellerTicketListState(sellerTicketUseCase: useCase)
  }
  
  var viewController: UIViewController {
    //    let viewController = SellerTicketList()
    //    viewController.store = state
    //
    //    return viewController
    list.viewController
  }
  
  var list: SellerTicketListComponent {
    SellerTicketListComponent(parent: self)
  }
  
  var editSellerPrice: EditSellerPriceComponent {
    EditSellerPriceComponent(parent: self)
  }
  
  var editDescription: EditDescriptionComponent {
    EditDescriptionComponent(parent: self)
  }
}

