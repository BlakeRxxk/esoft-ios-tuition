//
//  CDNImageLink.swift
//  CDNImageLink
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation

class CDNImageLink {
  private var link: String
  private var size: CDNImageSizes = .resize640x480
  private var type: CDNImageTypes?
  private var source: CDNHosts = .cloudEsoft
  
  init(_ baseURL: String) {
    self.link = baseURL
  }
  
  @discardableResult
  func set(size: CDNImageSizes) -> CDNImageLink {
    self.size = size
    
    return self
  }
  
  @discardableResult
  func set(type: CDNImageTypes) -> CDNImageLink {
    self.type = type
    
    return self
  }
  
  @discardableResult
  func set(source: CDNHosts) -> CDNImageLink {
    self.source = source
    
    return self
  }
  
  func build() -> String {
    let addressString: String = [
      source.rawValue,
      size.rawValue,
      type?.rawValue,
      link
      ]
      .compactMap { $0 }
      .joined(separator: "/")
      .replacingOccurrences(of: "\\/{2,}", with: "\\/", options: .regularExpression)
    
    return "https://\(addressString)"
  }
  
  func buildURL() -> URL? {
    URL(string: build())
  }
}
