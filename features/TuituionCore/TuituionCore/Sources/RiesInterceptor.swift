//
//  RiesInterceptor.swift
//  TuituionCore
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Network
import Foundation

public final class RiesInterceptor: NetworkAPIRequestInterceptor {
  private let apiKey: String
  private let keyName: String = "API_KEY"
  
  public init() {
<<<<<<< HEAD
    self.apiKey = Configuration.Ries.apiKey
=======
    self.apiKey = "demo_lk_ios"
>>>>>>> master
  }
  
  public func intercept(_ request: URLRequest) -> URLRequest {
    var urlComponents = URLComponents(string: request.url?.absoluteString ?? "")
    let queryItem: URLQueryItem = URLQueryItem(name: keyName.lowercased(), value: apiKey)
<<<<<<< HEAD

=======
    
>>>>>>> master
    if urlComponents?.queryItems != nil {
      urlComponents?.queryItems?.append(queryItem)
    } else {
      urlComponents?.queryItems = [queryItem]
    }
    
    if let url = urlComponents?.url {
      var innerRequest = URLRequest(url: url)
      
      innerRequest.httpMethod = request.httpMethod
      innerRequest.httpBody = request.httpBody
      
      if let headers = request.allHTTPHeaderFields {
        headers.forEach { innerRequest.setValue($0.value, forHTTPHeaderField: $0.key) }
      }
      
      return innerRequest
    } else {
      return request
    }
  }
}
