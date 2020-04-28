//
//  URLRequest+Extensions.swift
//  NetworkTests
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation

extension URLRequest {
  func urlHasPrefix(_ prefix: String) -> Bool {
    self.url!.absoluteString.hasPrefix(prefix)
  }
  
  func urlHasSuffix(_ suffix: String) -> Bool {
    self.url!.absoluteString.hasSuffix(suffix)
  }
  
  func urlIsEquals(_ url: String) -> Bool {
    self.url!.absoluteString == url
  }
}
