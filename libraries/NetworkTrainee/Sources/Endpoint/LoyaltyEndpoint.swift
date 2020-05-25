//
//  LoyaltyEndpoint.swift
//  NetworkTrainee
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation

public enum LoyaltyApi {
  case loyaltyCompany
}

extension LoyaltyApi: EndpointType {
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
    case .loyaltyCompany:
      return "/loyaltyCompany"
    default:
      return "/loyaltyCompany"
    }
  }

  var httpMethod: HTTPMethod {
    .get
  }

  var task: HTTPTask {
    switch self {
    case .loyaltyCompany:
      return .requestParameters(bodyParameters: nil,
                                bodyEncoding: .urlEncoding,
                                urlParameters: ["limit": "50",
                                                "api_key": "demo_mobile"])

    }
  }

  var headers: HTTPHeaders? {
    nil
  }
}
