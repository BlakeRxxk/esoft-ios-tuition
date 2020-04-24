//
//  Router.swift
//  Network
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation
import RxSwift

public typealias NetworkRouterCompletion = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void

protocol NetworkRouter: class {
  associatedtype Endpoint: EndpointType
  associatedtype APIError: Error
  associatedtype DTO

  func request(_ route: Endpoint, completion: @escaping NetworkRouterCompletion)
  func request(_ route: Endpoint) -> Observable<Result<DTO, APIError>>
  func cancel()
}

public struct Response<T: Codable> {
  public let status: Int
  public let success: Bool
  public let data: T
  
  public init(status: Int,
              success: Bool,
              data: T) {
    self.status = status
    self.success = success
    self.data = data
  }
}

extension Response: Codable {
  enum ResponseKeys: String, CodingKey {
    case status
    case success
    case data
  }
}

public struct APIError: Error {
  public let message: String
  public let code: Int
}

extension APIError: Codable, Equatable {
  enum CodingKeys: String, CodingKey {
    case message
    case code
  }
}

class Router<Endpoint: EndpointType, DTO: Codable, DTOError: Error>: NetworkRouter {
  private var task: URLSessionTask?
  
  func request(_ route: Endpoint) -> Observable<Result<DTO, APIError>> {
    guard Reachability.isConnectedToNetwork() else {
      return .just(.failure(APIError(message: "unreachable", code: 1000)))
    }
    
    do {
      
    } catch {
      return .just( .failure(APIError(message: "cannot build request", code: 1001)))
    }
  }
  
  
  
  func request(_ route: Endpoint, completion: @escaping NetworkRouterCompletion) {
    let session = URLSession.shared
    
    guard Reachability.isConnectedToNetwork() else {
      return completion(nil, nil, NetworkResponse.unreachable)
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
