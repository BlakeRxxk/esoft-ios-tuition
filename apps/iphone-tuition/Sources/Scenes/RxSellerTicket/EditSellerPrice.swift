//
//  EditSellerPrice.swift
//  AppLibrary
//
//  Created by wtildestar on 16/06/2020.
//

import NeedleFoundation
import Network
import TuituionCore
import SellerTicketCore
import SellerTicketImplementation
import SellerTicketUI

protocol EditSellerPriceBuilder {
  var viewController: UIViewController { get }
}

class EditSellerPriceComponent: Component<EmptyDependency>, EditSellerPriceBuilder {
  
  var useCase: EditSellerPriceUseCase {
    shared {
      EditSellerPriceUseCaseImplementation(editSellerPriceRepository: repository)
    }
  }
  
  var repository: EditSellerPriceRepository {
    shared {
      EditSellerPriceRepositoryImplementation(editSellerPriceGateway: gateway)
    }
  }
  
  var networkService: NetworkAPI {
    let service = NetworkAPI(session: .init(.shared),
                             decoder: RiesDecoder(),
                             baseUrl: URL(string: "https://us-central1-esoft-tuition-cloud.cloudfunctions.net/recomendedPrice")!)
    service.requestInterceptors.append(RiesInterceptor())
    
    return service
  }
  
  var gateway: EditSellerPriceGateway {
    shared {
      EditSellerPriceGatewayImplementation(networkService: networkService)
    }
  }
  
  var state: EditSellerPriceListState {
    EditSellerPriceListState(editSellerPriceUseCase: useCase)
  }
  
  var viewController: UIViewController {
    let viewController = EditSellerPriceList()
    viewController.store = state
    
    return viewController
  }
}
