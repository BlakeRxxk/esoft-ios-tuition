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
    
    let root = UINavigationController(rootViewController: RootViewController(objectsBuilder: objectsComponent))
      
    root.navigationBar.setStyles(UINavigationBar.Styles.default)
    return root
  }
  
  var objectsComponent: ObjectsComponent {
      ObjectsComponent(parent: self)
  }
}
