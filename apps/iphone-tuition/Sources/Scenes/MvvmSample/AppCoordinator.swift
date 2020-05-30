//
//  AppCoordinator.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
  let window: UIWindow
  
  init(window: UIWindow) {
    self.window = window
  }
  
  func start() {
    let navigationController: UINavigationController = UINavigationController()
    
    window.rootViewController = navigationController
    window.makeKeyAndVisible()
    
    let sampleMvvm = DemoMvvmCoordinator(navigationController: navigationController)
    sampleMvvm.coordinate(to: sampleMvvm)
    
  }
}
