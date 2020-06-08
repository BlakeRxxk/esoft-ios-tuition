//
//  PhotosEndpoint.swift
//  NetworkTrainee#iphonesimulator-x86_64
//
//  Created by wtildestar on 10/05/2020.
//

import Foundation

public enum PhotosApi {
  case photos
}

extension PhotosApi: EndpointType {
  var environmentBaseURL: String {
    switch NetworkManager.environment {
    default:
      return "https://cdn.esoft.digital/"
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
    case .photos:
      return "640480/media/photos/b0/d8/"
    }
  }
  
  var httpMethod: HTTPMethod {
    .get
  }
  
  var task: HTTPTask {
    switch self {
    case .photos:
      return .requestParameters(bodyParameters: nil,
                                bodyEncoding: .urlEncoding,
                                urlParameters: [:])
    }
  }
  
  var headers: HTTPHeaders? {
    nil
  }
}
