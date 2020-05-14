//
//  CurrencyComparableTests.swift
//  CurrencyTests
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import XCTest
@testable import Currency

final class CurrencyComparableTests: XCTestCase {
  
  func testLessThan() {
    let usd: Currency = Currency(amt: 100, currency: .USD)
    let usd2: Currency = Currency(amt: 99, currency: .USD)

    XCTAssertTrue(usd2 < usd)
    XCTAssertFalse(usd < usd2)
  }
  
  func testMultiply() {
    let usd: Currency = Currency(amt: 1, currency: .USD)
    let usd2: Currency = Currency(amt: 10, currency: .USD)
    let eur: Currency = Currency(amt: 10, currency: .EUR)

    XCTAssert(usd * usd2 == Currency(amt: 10, currency: .USD))
    XCTAssert(usd * 2.0 == Currency(amt: 2, currency: .USD))
    XCTAssert(3.0 * usd == Currency(amt: 3, currency: .USD))
    XCTAssert(usd * eur == Currency(amt: 0, currency: .USD))
  }

  func testDivide() {
    let usd: Currency = Currency(amt: 100, currency: .USD)
    let usd3: Currency = Currency(amt: 0, currency: .USD)
    let usd2: Currency = Currency(amt: 10, currency: .USD)
    let eur: Currency = Currency(amt: 10, currency: .EUR)

    XCTAssert(usd / usd2 == Currency(amt: 10, currency: .USD))
    XCTAssert(usd / 2.0 == Currency(amt: 50, currency: .USD))
    XCTAssert(2.0 / usd == Currency(amt: 0.01, currency: .USD))
    XCTAssert(usd / eur == Currency(amt: 0, currency: .USD))
    
    XCTAssert(usd / 0 == Currency(amt: 0, currency: .USD))
    XCTAssert(0 / usd == Currency(amt: 0, currency: .USD))
    XCTAssert(0 / usd3 == Currency(amt: 0, currency: .USD))
  }
  
  func testSumm() {
    let usd: Currency = Currency(amt: 100, currency: .USD)
    let usd2: Currency = Currency(amt: 10, currency: .USD)
    let eur: Currency = Currency(amt: 10, currency: .EUR)

    XCTAssert(usd + usd2 == Currency(amt: 110, currency: .USD))
    XCTAssert(usd + 2.0 == Currency(amt: 102, currency: .USD))
    XCTAssert(2.0 + usd == Currency(amt: 102, currency: .USD))
    XCTAssert(usd + eur == Currency(amt: 0, currency: .USD))
  }
  
  func testSubstract() {
    let usd: Currency = Currency(amt: 100, currency: .USD)
    let usd2: Currency = Currency(amt: 10, currency: .USD)
    let eur: Currency = Currency(amt: 10, currency: .EUR)

    XCTAssert(usd - usd2 == Currency(amt: 90, currency: .USD))
    XCTAssert(usd - 2.0 == Currency(amt: 98, currency: .USD))
    XCTAssert(2.0 - usd == Currency(amt: -98, currency: .USD))
    XCTAssert(usd - eur == Currency(amt: 0, currency: .USD))
  }
  
  func testDivideWithoutReminder() {
    let usd: Currency = Currency(amt: 100, currency: .USD)
    let usd3: Currency = Currency(amt: 0, currency: .USD)
    let usd2: Currency = Currency(amt: 10, currency: .USD)
    let eur: Currency = Currency(amt: 10, currency: .EUR)

    XCTAssert(usd % usd2 == Currency(amt: 0, currency: .USD))
    XCTAssert(usd % 2.0 == Currency(amt: 0, currency: .USD))
    XCTAssert(2.0 % usd == Currency(amt: 2, currency: .USD))
    XCTAssert(usd % eur == Currency(amt: 0, currency: .USD))
    
    XCTAssert(usd % 0 == Currency(amt: 0, currency: .USD))
    XCTAssert(0 % usd == Currency(amt: 0, currency: .USD))
    XCTAssert(0 % usd3 == Currency(amt: 0, currency: .USD))
    XCTAssert(usd % usd3 == Currency(amt: 0, currency: .USD))
  }
}
