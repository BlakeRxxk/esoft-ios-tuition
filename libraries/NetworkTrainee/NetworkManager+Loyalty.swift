//
//  NetworkManager+Loyalty.swift
//  NetworkTrainee
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation

extension NetworkManager {
  public func getLoyalty(page: Int, completion: @escaping (_ movie: [Loyalty]?, _ error: String?) -> Void) {
    loyaltyRouter.request(.loyaltyCompany) { data, response, error in

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
            let wrapper = try JSONDecoder().decode(Response<[Loyalty]>.self, from: responseData)
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
}
