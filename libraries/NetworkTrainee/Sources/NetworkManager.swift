//
//  NetworkManager.swift
//  Network
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation

public struct NetworkManager {
  enum NetworkEnvironment {
    case development
    case staging
    case production
  }

  static let environment: NetworkEnvironment = .production

  let citiesRouter = Router<CitiesApi>()
  let loyaltyRouter = Router<LoyaltyApi>()

  public init() {}
  
  func handleNetworkResponse(_ response: HTTPURLResponse) -> NetworkResult<String> {
    switch response.statusCode {
    case 200...299: return .success
    case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
    case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
    case 600: return .failure(NetworkResponse.outdated.rawValue)
    default: return .failure(NetworkResponse.failed.rawValue)
    }
  }
}
