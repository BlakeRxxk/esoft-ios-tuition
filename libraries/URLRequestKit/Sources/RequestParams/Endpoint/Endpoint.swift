//
//  Endpoint.swift
//  URLRequestKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation

public struct Endpoint: RequestParam {
  public var type: RequestParamType = .endpoint
  public var key: String?
  public var value: Any?
  public var children: [RequestParam]?
  
  public init(_ value: String) {
    self.value = value
  }
  
  public init(protocol type: ProtocolType, url: String) {
    self.value = "\(type.rawValue)://\(url)"
  }
  
  public init(baseURL: String, path: String, version: String = "v2") {
    self.value = "\(ProtocolType.https.rawValue)://\(baseURL)\(version)/\(path)"
  }
}
