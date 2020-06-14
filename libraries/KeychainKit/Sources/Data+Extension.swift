//
//  Data+Extension.swift
//  KeychainKit
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation

/// https://stackoverflow.com/a/38024025/2845836
extension Data {
  init<T>(from value: T) {
    self = Swift.withUnsafeBytes(of: value) { Data($0) }
  }
  
  // TODO: Throw KeychainError.conversionError instead of nil
  func convert<T>(type: T.Type) -> T? where T: ExpressibleByIntegerLiteral {
    var value: T = 0
    guard count >= MemoryLayout.size(ofValue: value) else { return nil }
    _ = Swift.withUnsafeMutableBytes(of: &value, { copyBytes(to: $0)})
    return value
  }
}
