//
//  CitiesPresenter.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation
import NetworkTrainee
import UIKit

typealias ShowCitiesCompletionHandler = (_ cities: [CityViewModel]) -> Void

class CitiesPresenterImplementation {
  private let interactor: CitiesInteractor
  private let router: CitiesRouter
  internal var presentingViewController: UIViewController? {
    didSet {
      updatePresentingViewController()
    }
  }

  init(interactor: CitiesInteractor, router: CitiesRouter) {
    self.interactor = interactor
    self.router = router
  }
  
  func updatePresentingViewController() {
    guard let presentingViewController = presentingViewController else { return }
    router.presentingViewController(presentingViewController: presentingViewController)
  }
}

protocol CitiesPresenter {
  func loadCities(completion: @escaping ShowCitiesCompletionHandler)
  
  func showDetails()
}

extension CitiesPresenterImplementation: CitiesPresenter {
  func loadCities(completion: @escaping ShowCitiesCompletionHandler) {
    interactor.fetchCities { [weak self] cities in
      guard let viewModels = self?.mapToViewModel(cities) else {
        completion([])
        return
      }
      
      completion(viewModels)
    }
  }

  private func mapToViewModel(_ cities: [City]) -> [CityViewModel] {
    cities.map { CityViewModel(id: $0.id, name: $0.name) }
  }
  
  func showDetails() {
    router.showDetail()
  }
}
