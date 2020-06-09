//
//  CitiesComponent.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import NeedleFoundation
import Foundation
import NetworkTrainee

protocol CitiesBuilder {
  var citiesViewController: UIViewController { get }
}

class CitiesComponent: Component<EmptyDependency>, CitiesBuilder {
  var networkManager: NetworkManager {
    NetworkManager()
  }

  var interactor: CitiesInteractor {
    CitiesInteractorImplementation(networkManager: networkManager)
  }
  
  var presenter: CitiesPresenter {
    CitiesPresenterImplementation(interactor: interactor, router: router)
  }
  
  var router: CitiesRouter {
    CitiesRouterImplementation()
  }
  
  var citiesViewController: UIViewController {
    let controller = CitiesViewController(presenter: presenter)
    let pres = controller.presenter as? CitiesPresenterImplementation
    
    pres?.presentingViewController = controller
    
    return controller
  }
}
