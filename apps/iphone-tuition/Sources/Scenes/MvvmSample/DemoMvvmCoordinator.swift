//
//  DemoMvvmCoordinator.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation
import UIKit

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
