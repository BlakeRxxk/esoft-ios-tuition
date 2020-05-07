//
//  Currency+Extension.swift
//  Currency
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation

extension Currency {
  public static var exchangeRates: Set<ExchangeRate> = Set()
  
  public func pow(power: Int) -> Currency {
    let amount = money.0.raising(toPower: power, withBehavior: Currency.decimalHandler)
    return Currency(amt: amount.floatValue, currency: currency)
  }
  
  public func amount(in currency: CCY) -> Currency {
    let exchangeRate = Currency.exchangeRates.filter { rate -> Bool in
      rate.rhs == currency || rate.lhs == currency
    }

    guard let rate = exchangeRate.first else {
      return Currency(amt: money.0.floatValue, currency: currency)
    }
    
    if rate.lhs == currency {
      return Currency(amt: money.0.floatValue * rate.inverseRate, currency: currency)
    } else {
      return Currency(amt: money.0.floatValue * rate.rate, currency: currency)
    }
  }
}

extension Currency: CustomStringConvertible {
  public var description: String {
    let amount = money.0.rounding(accordingToBehavior: Currency.decimalHandler)
    return "\(amount) \(money.1)"
  }
}
