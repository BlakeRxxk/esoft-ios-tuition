//
//  NetworkAPIRequestInterceptor.swift
//  Network
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation

public protocol NetworkAPIRequestInterceptor {
  func intercept(_ request: URLRequest) -> URLRequest
}
