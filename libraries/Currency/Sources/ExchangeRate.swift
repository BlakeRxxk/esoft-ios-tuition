//
//  ExchangeRate.swift
//  Currency
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation

public struct ExchangeRate: Hashable {
  public let lhs: CCY
  public let rhs: CCY
  public let rate: Float
  
  public var inverseRate: Float {
    1 / rate
  }
}

extension ExchangeRate: CustomStringConvertible {
  public var description: String {
    "\(lhs)-\(rhs): \(rate)"
  }
}

public func == (lhs: ExchangeRate, rhs: ExchangeRate) -> Bool {
  lhs.hashValue == rhs.hashValue
}
