//
//  ExchangeRateTests.swift
//  CurrencyTests
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import XCTest
@testable import Currency

final class ExchangeRateTests: XCTestCase {
  
  func testInverseRate() {
    let exchangeRate: ExchangeRate = ExchangeRate(lhs: .USD, rhs: .EUR, rate: 0.93)
    XCTAssert(exchangeRate.inverseRate == (1 / 0.93))
  }
  
  func testDescriptionRate() {
    let exchangeRate: ExchangeRate = ExchangeRate(lhs: .USD, rhs: .EUR, rate: 0.93)

    XCTAssertEqual(exchangeRate.description, "USD-EUR: 0.93")
  }
  
  func testEquatableRate() {
    let exchangeRate1: ExchangeRate = ExchangeRate(lhs: .USD, rhs: .EUR, rate: 0.93)
    let exchangeRate2: ExchangeRate = ExchangeRate(lhs: .USD, rhs: .EUR, rate: 0.93)
    let exchangeRate3: ExchangeRate = ExchangeRate(lhs: .USD, rhs: .EUR, rate: 0.94)

    XCTAssert(exchangeRate1 == exchangeRate2)
    XCTAssert(exchangeRate1 != exchangeRate3)
  }
}
