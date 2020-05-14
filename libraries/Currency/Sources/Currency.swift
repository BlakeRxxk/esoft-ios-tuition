//
//  Currency.swift
//  Currency
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation

public struct Currency {
  public static let decimalHandler = NSDecimalNumberHandler(roundingMode: .down,
                                                            scale: 2,
                                                            raiseOnExactness: true,
                                                            raiseOnOverflow: true,
                                                            raiseOnUnderflow: true,
                                                            raiseOnDivideByZero: true)
  
  public let money: (NSDecimalNumber, CCY)
  
  public var amount: Float {
    money.0.rounding(accordingToBehavior: Currency.decimalHandler).floatValue
  }
  
  public var currency: CCY {
    money.1
  }

  public init(amt: Int, currency: CCY) {
    money = (NSDecimalNumber(decimal: Decimal(amt)), currency)
  }
  
  public init(amt: Double, currency: CCY) {
    money = (NSDecimalNumber(value: amt), currency)
  }
  
  public init(amt: Float, currency: CCY) {
    money = (NSDecimalNumber(value: amt), currency)
  }
}

extension Currency: Equatable {
  public static func == (lhs: Currency, rhs: Currency) -> Bool {
    lhs.amount == rhs.amount && lhs.currency == rhs.currency
  }
}
