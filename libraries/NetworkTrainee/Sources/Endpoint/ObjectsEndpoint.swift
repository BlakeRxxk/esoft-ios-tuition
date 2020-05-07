//
//  ObjectsEndpoint.swift
//  NetworkTrainee#iphonesimulator-x86_64
//
//  Created by Алексей Макаров on 07.05.2020.
//

import Foundation

public enum ObjectsApi {
  case objects
}

//enum NetworkEnvironment {
//  case development
//  case staging
//  case production
//}

extension ObjectsApi: EndpointType {
  var environmentBaseURL: String {
    switch NetworkManager.environment {
    default:
      return "https://us-central1-esoft-tuition-cloud.cloudfunctions.net"
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
    case .objects:
      return "/objects"
    }
  
  }
  
  var httpMethod: HTTPMethod {
    .get
  }
  
  var task: HTTPTask {
    switch self {
    case .objects:
      return .requestParameters(bodyParameters: nil,
      bodyEncoding: .urlEncoding,
      urlParameters: [:])
    }
  }
  
  var headers: HTTPHeaders? {
    nil
  }
}
