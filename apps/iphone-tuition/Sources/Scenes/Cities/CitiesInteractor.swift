//
//  CitiesInteractor.swift
//  AppLibrary
//
//  Created by Blake Rxxk on 25.05.2020.
//

import Foundation
import NetworkTrainee

typealias FetchCitiesCompletionHandler = (_ cities: [City]) -> Void

protocol CitiesInteractor {
  func fetchCities(completion: @escaping FetchCitiesCompletionHandler)
}

class CitiesInteractorImplementation {
  let networkManager: NetworkManager
  
  init(networkManager: NetworkManager) {
    self.networkManager = networkManager
  }
}

extension CitiesInteractorImplementation: CitiesInteractor {
  func fetchCities(completion: @escaping FetchCitiesCompletionHandler) {
    networkManager.getCilies(page: 1) { (response, _) in
      guard let cities = response else {
        completion([])
        return
      }
      
      completion(cities)
      
    }
  }
}
