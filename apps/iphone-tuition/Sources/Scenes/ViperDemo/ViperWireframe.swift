//
//  ViperWireframe.swift
//  AppLibrary
//
//  Created by Blake Rxxk on 25.05.2020.
//

import Foundation
import UIKit
import NetworkTrainee

final class ViperModule {
  static func buildModule() -> UIViewController {
    let serviceAPI = NetworkManager()

    let interactor = ViperInteractorImplementation(serviceAPI: serviceAPI)
    let router = ViperRouterImplementation()
    let presenter = ViperPresenterImplementation(interactor: interactor, router: router)
    
    let viewController = ViperViewController(presenter: presenter)
    router.presentingView = viewController
    
    return viewController
  }
}
