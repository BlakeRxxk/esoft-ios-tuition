//
//  NetworkManager.swift
//  Network
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation

public struct NetworkManager {
  static let environment: NetworkEnvironment = .production
  static let MovieAPIKey = ""
  private let router = Router<CitiesApi>()
  public init() {}
  
  public func getCilies(page: Int, completion: @escaping (_ movie: [City]?, _ error: String?) -> Void) {
    router.request(.cities) { data, response, error in
      
      if error != nil {
        completion(nil, "Please check your network connection.")
      }
      
      if let response = response as? HTTPURLResponse {
        let result = self.handleNetworkResponse(response)
        switch result {
        case .success:
          guard let responseData = data else {
            completion(nil, NetworkResponse.noData.rawValue)
            return
          }
          do {
            let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
            let wrapper = try JSONDecoder().decode(Response<[City]>.self, from: responseData)
            completion(wrapper.data, nil)
          } catch {
            completion(nil, NetworkResponse.unableToDecode.rawValue)
          }
        case .failure(let networkFailureError):
          completion(nil, networkFailureError)
        }
      }
    }
  }
  
  private func handleNetworkResponse(_ response: HTTPURLResponse) -> NetworkResult<String> {
    switch response.statusCode {
    case 200...299: return .success
    case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
    case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
    case 600: return .failure(NetworkResponse.outdated.rawValue)
    default: return .failure(NetworkResponse.failed.rawValue)
    }
  }
}
