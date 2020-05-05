//
//  InterceptorMock.swift
//  NetworkTests
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation
import Network

public class TokenInterceptor: NetworkAPIRequestInterceptor {
  private let tokenValue: () -> String
  private let headerName: String
  
  public init(tokenValue: @escaping () -> String, headerName: String) {
    self.tokenValue = tokenValue
    self.headerName = headerName
  }
  
  public func intercept(_ request: URLRequest) -> URLRequest {
    var mutableRequest = request
    mutableRequest.addValue(tokenValue(), forHTTPHeaderField: headerName)
    return mutableRequest
  }
}

struct InterceptorMock: NetworkAPIRequestInterceptor {
  func intercept(_ request: URLRequest) -> URLRequest {
    var mutableRequest = request
    mutableRequest.addValue("Interceptor", forHTTPHeaderField: UUID().uuidString)
    return mutableRequest
  }
}
