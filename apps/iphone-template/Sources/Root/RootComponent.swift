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
                                                sellerTicketBuilder: sellerTicketComponent)
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
}
