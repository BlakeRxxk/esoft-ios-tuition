//
//  CurrencyTests.swift
//  CurrencyTests
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import XCTest
@testable import Currency

final class CurrencyTests: XCTestCase {
  var usd: Currency?
  var eur: Currency?
  var rub: Currency?
  
  override func setUp() {
    super.setUp()
    usd = Currency(amt: 100, currency: .USD)
    eur = Currency(amt: 98.8, currency: .EUR)
    rub = Currency(amt: Float(99.5), currency: .RUB)
  }

  func testCurencyAmount() {
    XCTAssert(usd?.amount == 100.0)
    XCTAssert(eur?.amount == 98.8)
    XCTAssert(rub?.amount == 99.5)
    
    addTeardownBlock {
      self.usd = nil
      self.eur = nil
      self.rub = nil
    }
  }
  
  func testCurencyCCY() {
    XCTAssert(usd?.currency == CCY.USD)
    XCTAssert(eur?.currency == CCY.EUR)
    XCTAssert(rub?.currency == CCY.RUB)
    
    addTeardownBlock {
      self.usd = nil
      self.eur = nil
      self.rub = nil
    }
  }
  
  func testCurencyEquatable() {
    let anotherUSD1: Currency = Currency(amt: 100, currency: .USD)
    let anotherUSD2: Currency = Currency(amt: 99, currency: .USD)
    
    XCTAssert(usd != eur)
    XCTAssert(usd == anotherUSD1)
    XCTAssert(usd != anotherUSD2)
    
    addTeardownBlock {
      self.usd = nil
      self.eur = nil
      self.rub = nil
    }
  }
}
