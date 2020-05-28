//
//  RootComponent.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import NeedleFoundation
import Foundation

public final class RootComponent: BootstrapComponent {
  
  var rootViewController: UIViewController {
    let rootViewController = RootViewController(objectsBuilder: objectsComponent,
                                                sellerTicketBuilder: sellerTicketComponent,
                                                discountBuilder: discountComponent,
                                                mortgageBuilder: mortgageComponent,
                                                loggedOutBuilder: loggedOutComponent,
                                                citiesBuilder: citiesComponent,
                                                rxdemoBuilder: rxdemo)

    let root = UINavigationController(rootViewController: rootViewController)
      
    root.navigationBar.setStyles(UINavigationBar.Styles.default)
    return root
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
    SpecialistsComponent(parent: self)
  }

  var citiesComponent: CitiesComponent {
    CitiesComponent(parent: self)
  }

  var rxdemo: SpecialistsComponent {
    SpecialistsComponent(parent: self)
  }
}
