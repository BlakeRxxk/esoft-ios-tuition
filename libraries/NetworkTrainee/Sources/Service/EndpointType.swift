//
//  EndpointType.swift
//  Network
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation

protocol EndpointType {
  var baseURL: URL { get }  // https://developers.etagi.com/api/v2/
  var path: String { get } // /cities/list
  var httpMethod: HTTPMethod { get } 
  var task: HTTPTask { get }
  var headers: HTTPHeaders? { get }
}
