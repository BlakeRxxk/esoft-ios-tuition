//
//  Presenter.swift
//  AppLibrary
//
//  Created by Blake Rxxk on 25.05.2020.
//

import Foundation

typealias LoadCitiesHandler = (_ cities: [CityViewModel]) -> Void

final class ViperPresenterImplementation {
  let interactor: ViperInteractor
  let router: ViperRouter
  
  init(interactor: ViperInteractor, router: ViperRouter) {
    self.interactor = interactor
    self.router = router
  }
}

protocol ViperPresenter: AnyObject {
  func loadCities(completion: @escaping LoadCitiesHandler)
  
  func showDetail()
}

extension ViperPresenterImplementation: ViperPresenter {
  func loadCities(completion: @escaping LoadCitiesHandler) {
    interactor.fetchCities { cities in
      let viewModels = cities.map { CityViewModel(id: $0.id, name: $0.name) }
      
      completion(viewModels)
    }
  }
  
  func showDetail() {
    router.showDetail()
  }
}
