//
//  Array+Attribute.swift
//  KeychainKit
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation

extension Array where Element == Attribute {
  func compose() -> CFDictionary {
    self
      .map { $0.rawValue }
      .reduce(into: [String: Any]()) { $0[$1.key] = $1.value }
      as CFDictionary
  }
}
