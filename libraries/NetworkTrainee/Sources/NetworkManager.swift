//
//  NetworkManager.swift
//  Network
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import UIKit

public struct NetworkManager {
  static let environment: NetworkEnvironment = .production

  private let router = Router<CitiesApi>()
  private let objectsRouter = Router<ObjectsApi>()
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
  
  public func getDistricts(page: Int, completion: @escaping (_ movie: [District]?, _ error: String?) -> Void) {
    router.request(.districts) { data, response, error in
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
            let wrapper = try JSONDecoder().decode(Response<[District]>.self, from: responseData)
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
  
  public func getObjects(completion: @escaping (_ movie: [Objects]?, _ error: String?) -> Void) {
    objectsRouter.request(.objects) { data, response, error in
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
            let wrapper = try JSONDecoder().decode(Response<[Objects]>.self, from: responseData)
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
  
  public func fetchImage(withPhotoName photoName: String, completion: @escaping (UIImage) -> ()) {
    let baseUrl = "https://cdn.esoft.digital/640480\(photoName)"
    guard let url = URL(string: baseUrl) else { return }
    URLSession.shared.dataTask(with: url) { (data, response, error) in
      if let error = error {
        print("Failed to fetch image with error: ", error.localizedDescription)
        return
      }
      guard let data = data else { return }
      guard let image = UIImage(data: data) else { return }
      completion(image)
    }.resume()
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
