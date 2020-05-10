//
//  Currency+Extensions.swift
//  CurrencyTests
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import XCTest
@testable import Currency

final class CurrencyExtensionsTests: XCTestCase {
  var usd: Currency?
  
  override func setUp() {
    super.setUp()
    usd = Currency(amt: 100, currency: .USD)
  }
  
  func testCurencyPow() {
    XCTAssert(usd?.pow(power: 2) == Currency(amt: 10000, currency: .USD))
    
    addTeardownBlock {
      self.usd = nil
    }
  }

  func testCurencyAmount() {
    XCTAssert(usd?.amount(in: .EUR) == Currency(amt: 100, currency: .EUR))

    let rate: ExchangeRate = ExchangeRate(from: .USD, to: .EUR, rate: 0.93)
    let rate2: ExchangeRate = ExchangeRate(from: .USD, to: .RUB, rate: 73.78)
    let rate3: ExchangeRate = ExchangeRate(from: .GBP, to: .USD, rate: 1.24)
    Currency.exchangeRates.insert(rate2)
    Currency.exchangeRates.insert(rate)
    Currency.exchangeRates.insert(rate3)

    XCTAssert(usd?.amount(in: .EUR) == Currency(amt: 93, currency: .EUR))
    XCTAssert(usd?.amount(in: .RUB) == Currency(amt: 7378, currency: .RUB))
    XCTAssert(usd?.amount(in: .GBP) == Currency(amt: 80.64, currency: .GBP))
    
    addTeardownBlock {
      self.usd = nil
    }
  }
  
  func testCurrencyDescription() {
    XCTAssertEqual(usd?.description, "100 USD")
    addTeardownBlock {
      self.usd = nil
    }
  }
}
