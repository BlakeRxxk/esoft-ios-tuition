//
//  Coordinator.swift
//  AppLibrary
//
//  Created by Blake Rxxk on 22.05.2020.
//

import Foundation
import UIKit

protocol Coordinator {
  func start()
  func coordinate(to coordinator: Coordinator)
}

extension Coordinator {
  func coordinate(to coordinator: Coordinator) {
    coordinator.start()
  }
}

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

class DemoMvvmCoordinator: Coordinator {

  unowned let navigationController: UINavigationController
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  func start() {
    let networkService = CatalogsAPI(session: .init(.shared), baseUrl: URL(string: "https://developers.etagi.com/api/v2/")!)
    let viewModel: ViewModel = ViewModelImplementation(networkService: networkService)
    let viewController = MvvmSample(viewModel: viewModel)
    
    navigationController.pushViewController(viewController, animated: true)
  }
  
}
