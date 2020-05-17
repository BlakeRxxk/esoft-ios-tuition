//
//  Currency+Comparable.swift
//  Currency
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation

extension Currency: Comparable {
  public static func < (lhs: Currency, rhs: Currency) -> Bool {
    if lhs.currency == rhs.currency && lhs.amount < rhs.amount {
      return true
    }
    
    return false
  }
  
  public static func * (lhs: Currency, rhs: Currency) -> Currency {
    if lhs.currency == rhs.currency {
      let money = lhs.money.0.multiplying(by: rhs.money.0)
      
      return Currency(amt: money.floatValue, currency: lhs.currency)
    }
    
    return Currency(amt: 0.0, currency: lhs.currency)
  }

  public static func * (lhs: Currency, rhs: Float) -> Currency {
    let amount = lhs.amount * rhs
    return Currency(amt: amount, currency: lhs.currency)
  }

  public static func * (lhs: Float, rhs: Currency) -> Currency {
    let amount = lhs * rhs.amount
    return Currency(amt: amount, currency: rhs.currency)
  }

  public static func / (lhs: Currency, rhs: Currency) -> Currency {
    if lhs.currency == rhs.currency {
      let money = lhs.money.0.dividing(by: rhs.money.0)
      
      return Currency(amt: money.floatValue, currency: lhs.currency)
    }
    
    return Currency(amt: 0.0, currency: lhs.currency)
    
  }

  public static func / (lhs: Currency, rhs: Float) -> Currency {
    if rhs != 0.00 {
      let amount = lhs.amount / rhs
      return Currency(amt: amount, currency: lhs.currency)
    }
    
    return Currency(amt: 0.00, currency: lhs.currency)
  }

  public static func / (lhs: Float, rhs: Currency) -> Currency {
    if rhs.amount != 0.00 {
      let amount = lhs / rhs.amount
      return Currency(amt: amount, currency: rhs.currency)
    }
    
    return Currency(amt: 0.00, currency: rhs.currency)
  }

  public static func + (lhs: Currency, rhs: Currency) -> Currency {
    if lhs.currency == rhs.currency {
      let money = lhs.money.0.adding(rhs.money.0)
      
      return Currency(amt: money.floatValue, currency: lhs.currency)
    }
    
    return Currency(amt: 0.0, currency: lhs.currency)
    
  }

  public static func + (lhs: Currency, rhs: Float) -> Currency {
    let amount = lhs.amount + rhs
    return Currency(amt: amount, currency: lhs.currency)
  }

  public static func + (lhs: Float, rhs: Currency) -> Currency {
    let amount = lhs + rhs.amount
    return Currency(amt: amount, currency: rhs.currency)
  }

  public static func - (lhs: Currency, rhs: Currency) -> Currency {
    if lhs.currency == rhs.currency {
      let money = lhs.money.0.subtracting(rhs.money.0)
      
      return Currency(amt: money.floatValue, currency: lhs.currency)
    }
    
    return Currency(amt: 0.0, currency: lhs.currency)
    
  }

  public static func - (lhs: Currency, rhs: Float) -> Currency {
    let amount = lhs.amount - rhs
    return Currency(amt: amount, currency: lhs.currency)
  }

  public static func - (lhs: Float, rhs: Currency) -> Currency {
    let amount = lhs - rhs.amount
    return Currency(amt: amount, currency: rhs.currency)
  }

  public static func % (lhs: Currency, rhs: Currency) -> Currency {
    if rhs.amount != 0.0 {
      let amt = lhs.amount.truncatingRemainder(dividingBy: rhs.amount)
      return Currency(amt: amt, currency: lhs.currency)
    }
    
    return Currency(amt: 0.0, currency: lhs.currency)
  }

  public static func % (lhs: Currency, rhs: Float) -> Currency {
    if rhs != 0.00 {
      let amount = lhs.amount.truncatingRemainder(dividingBy: rhs)
      return Currency(amt: amount, currency: lhs.currency)
    }
    
    return Currency(amt: 0.00, currency: lhs.currency)
  }

  public static func % (lhs: Float, rhs: Currency) -> Currency {
    if rhs.amount != 0.00 {
      let amount = lhs.truncatingRemainder(dividingBy: rhs.amount)
      return Currency(amt: amount, currency: rhs.currency)
    }
    
    return Currency(amt: 0.00, currency: rhs.currency)
  }
}
