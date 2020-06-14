//
//  viperInteractor.swift
//  AppLibrary
//
//  Created by Blake Rxxk on 25.05.2020.
//

import Foundation
import NetworkTrainee

typealias FetchCitiesHandler = (_ cities: [City]) -> Void

final class ViperInteractorImplementation {
  let serviceAPI: NetworkManager
  
  init(serviceAPI: NetworkManager) {
    self.serviceAPI = serviceAPI
  }
}

protocol ViperInteractor: AnyObject {
  func fetchCities(completion: @escaping FetchCitiesHandler)
}

extension ViperInteractorImplementation: ViperInteractor {
  func fetchCities(completion: @escaping FetchCitiesHandler) {
    serviceAPI.getCilies(page: 1) { (res, _) in
      guard let cities = res else {
        completion([])
        return
      }
      
      completion(cities)
    }
  }
}
