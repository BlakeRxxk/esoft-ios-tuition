//
//  CitiesEndpoint.swift
//  Network
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation

public enum CitiesApi {
  case cities
  case districts
}

enum NetworkEnvironment {
  case development
  case staging
  case production
}

extension CitiesApi: EndpointType {
  var environmentBaseURL: String {
    switch NetworkManager.environment {
    default:
      return "https://developers.etagi.com/api/v2/catalogs"
    }
  }
  
  var baseURL: URL {
    guard let url = URL(string: environmentBaseURL) else {
      fatalError("baseURL could not be configured.")
    }
    
    return url
  }
  
  var path: String {
    switch self {
    case .cities:
      return "/cities/list"
    case .districts:
      return "/districts/list"
    }
  }
  
  var httpMethod: HTTPMethod {
    .get
  }
  
  var task: HTTPTask {
    switch self {
    case .cities:
      return .requestParameters(bodyParameters: nil,
                                bodyEncoding: .urlEncoding,
                                urlParameters: ["limit": "50",
                                                "api_key": "demo_mobile"])
      
    case .districts:
      return .requestParameters(bodyParameters: nil,
                                bodyEncoding: .urlEncoding,
                                urlParameters: ["limit": "10", "api_key": "demo_mobile"])
    }
  }
  
  var headers: HTTPHeaders? {
    nil
  }
}
