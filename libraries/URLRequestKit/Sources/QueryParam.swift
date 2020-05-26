//
//  QueryParam.swift
//  URLRequestKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation

public struct Query: RequestParam {
  public var type: RequestParamType = .query
  public var key: String?
  public var value: Any?
  public var children: [RequestParam]? = []
  
  /// Creates the `Query` from `[key:value]` pairs
  /// - Parameter params: Key-value pairs describing the `Query`
  public init(_ params: [String: String]) {
    Array(params.keys).forEach { key in
      // .addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)
      self.children?.append(QueryParam(key, value: (params[key])!))
    }
  }
  
  /// Creates the `Query` directly from an array of `QueryParam`s
  public init(_ params: [QueryParam]) {
    self.children = params
  }
}

public struct QueryParam: RequestParam {
  public var type: RequestParamType = .query
  public var key: String?
  public var value: Any?
  public var children: [RequestParam]?
  
  public init(_ key: String, value: String) {
    self.key = key
    self.value = value
  }
}
