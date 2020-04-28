//
//  EndpointType.swift
//  Network
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation

protocol EndpointType {
  var baseURL: URL { get }
  var path: String { get }
  var httpMethod: HTTPMethod { get }
  var task: HTTPTask { get }
  var headers: HTTPHeaders? { get }
}
