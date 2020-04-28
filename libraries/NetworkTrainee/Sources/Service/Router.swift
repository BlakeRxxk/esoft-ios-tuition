//
//  Router.swift
//  Network
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation

public typealias NetworkRouterCompletion = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void

enum NetworkResult<String> {
  case success
  case failure(String)
}

protocol NetworkRouter: class {
  associatedtype Endpoint: EndpointType
  
  func request(_ route: Endpoint, completion: @escaping NetworkRouterCompletion)
  func cancel()
}

class Router<Endpoint: EndpointType>: NetworkRouter {
  private var task: URLSessionTask?
  
  func request(_ route: Endpoint, completion: @escaping NetworkRouterCompletion) {
    let session = URLSession.shared
    
    guard Reachability.isConnectedToNetwork() else {
      let err = NSError(domain: NetworkResponse.failed.rawValue, code: 9999)
      return completion(nil, nil, err)
    }
    
    do {
      let request = try buildRequest(from: route)
      task = session.dataTask(with: request) { data, response, error in
        completion(data, response, error)
      }
    } catch {
      completion(nil, nil, error)
    }
    
    task?.resume()
  }
  
  func cancel() {
    task?.cancel()
  }
  
  private func buildRequest(from route: Endpoint) throws -> URLRequest {
    var request = URLRequest(url: route.baseURL.appendingPathComponent(route.path),
                             cachePolicy: .reloadRevalidatingCacheData,
                             timeoutInterval: 10.0)
    
    request.httpMethod = route.httpMethod.rawValue
    do {
      switch route.task {
      case .request:
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
      case .requestParameters(let bodyParameters,
                              let bodyEncoding,
                              let urlParameters):
        
        try self.configureParameters(bodyParameters: bodyParameters,
                                     bodyEncoding: bodyEncoding,
                                     urlParameters: urlParameters,
                                     request: &request)
        
      case .requestParametersAndHeaders(let bodyParameters,
                                        let bodyEncoding,
                                        let urlParameters,
                                        let additionalHeaders):
        
        self.addAdditionalHeaders(additionalHeaders, request: &request)
        try self.configureParameters(bodyParameters: bodyParameters,
                                     bodyEncoding: bodyEncoding,
                                     urlParameters: urlParameters,
                                     request: &request)
      }
      return request
    } catch {
      throw error
    }
  }
  
  private func configureParameters(bodyParameters: Parameters?,
                                   bodyEncoding: ParameterEncoding,
                                   urlParameters: Parameters?,
                                   request: inout URLRequest) throws {
    do {
      try bodyEncoding.encode(urlRequest: &request,
                              bodyParameters: bodyParameters, urlParameters: urlParameters)
    } catch {
      throw error
    }
  }
  
  private func addAdditionalHeaders(_ additionalHeaders: HTTPHeaders?, request: inout URLRequest) {
    guard let headers = additionalHeaders else { return }
    for (key, value) in headers {
      request.setValue(value, forHTTPHeaderField: key)
    }
  }
}
