//
//  RequestParam.swift
//  URLRequestKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation

public enum RequestParamType {
  case endpoint
  case query
  case combined
}

internal struct CombinedParams: RequestParam {
  var type: RequestParamType = .combined
  var key: String?
  var value: Any?
  var children: [RequestParam]?
  
  init(children: [RequestParam]) {
    self.children = children
  }
}

public protocol RequestParam {
  var type: RequestParamType { get }
  var key: String? { get }
  var value: Any? { get set }
  var children: [RequestParam]? { get }
}
