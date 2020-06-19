//
//  RootComponent.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import NeedleFoundation
import Foundation
import TuituionCore
import Network
import TuitionIntegrations

public final class RootComponent: BootstrapComponent {
  
  var rootNavigator: UINavigationController {
    shared {
      let root = UINavigationController()
      
      root.navigationBar.setStyles(UINavigationBar.Styles.default)
      return root
    }
  }
  
  var decoder: NetworkAPIDecoder {
    shared {
      RiesDecoder()
    } 
  }
  
  var apiKeyInterceptor: NetworkAPIRequestInterceptor {
    shared {
      RiesInterceptor()
    }
  }
  
  var networkService: NetworkAPIProtocol {
    shared {
      let service = NetworkAPI(session: .init(.shared),
                               decoder: decoder,
                               baseUrl: Configuration.Ries.baseURL)
      
      service.requestInterceptors.append(apiKeyInterceptor)
      
      return service
    }
  }
  
  var rootViewController: UIViewController {
    let rootViewController = RootViewController(objectsBuilder: objectsComponent,
                                                sellerTicketBuilder: sellerTicketComponent,
                                                discountBuilder: discountComponent,
                                                mortgageBuilder: mortgageComponent,
                                                loggedOutBuilder: loggedOutComponent,
                                                citiesBuilder: citiesComponent,
                                                rxdemoBuilder: rxdemo)
    
    rootNavigator.pushViewController(rootViewController, animated: true)
    
    return rootNavigator
  }
  
  var objectsComponent: ObjectsComponent {
    ObjectsComponent(parent: self)
  }
  
  var sellerTicketComponent: SellerTicketComponent {
    SellerTicketComponent(parent: self)
  }
  
  var discountComponent: DiscountComponent {
    DiscountComponent(parent: self)
  }
  
  var mortgageComponent: MortgageComponent {
    MortgageComponent(parent: self)
  }
  
  var loggedOutComponent: LoggedOutComponent {
    LoggedOutComponent(parent: self)
  }
  
  var rxdemo: SpecialistsComponent {
    shared {
      SpecialistsComponent(parent: self)
    }
  }
  
  var citiesComponent: CitiesComponent {
    CitiesComponent(parent: self)
  }
}
