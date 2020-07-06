//
//  SellerTicketEndpoint.swift
//  NetworkTrainee#iphonesimulator-x86_64
//
//  Created by wtildestar on 07/05/2020.
//

import Foundation

public enum SellerTicketApi {
  case sellerTicket
}

extension SellerTicketApi: EndpointType {
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
    case .sellerTicket:
      return "/sellerTicket"
    }
  }
  
  var httpMethod: HTTPMethod {
    .get
  }
  
  var task: HTTPTask {
    switch self {
    case .sellerTicket:
      return .requestParameters(bodyParameters: nil,
                                bodyEncoding: .urlEncoding,
                                urlParameters: [:])
    }
  }
  
  var headers: HTTPHeaders? {
    nil
  }
}
