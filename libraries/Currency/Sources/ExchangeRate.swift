//
//  ExchangeRate.swift
//  Currency
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation

public struct ExchangeRate: Hashable {
  public let from: CCY
  public let to: CCY
  public let rate: Float
  
  public var inverseRate: Float {
    1 / rate
  }
}

extension ExchangeRate: CustomStringConvertible {
  public var description: String {
    "\(from)-\(to): \(rate)"
  }
}

public func == (lhs: ExchangeRate, rhs: ExchangeRate) -> Bool {
  lhs.hashValue == rhs.hashValue
}
