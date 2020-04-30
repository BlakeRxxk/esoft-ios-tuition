//
//  EncodableTests.swift
//  NetworkTests
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import XCTest
@testable import Network

class EncodableTests: XCTestCase {
  func test_Dictionary_WhenDataIsValid_RetursDictionary() {
    let encodable = ModelMock(name: "Patrick", id: 5)
    let result = encodable.dictionary(with: JSONEncoder())
    XCTAssertNotNil(result)
    XCTAssertEqual(result?["name"] as? String, "Patrick")
    XCTAssertEqual(result?["id"] as? Int, 5)
  }
  
  func test_Dictionary_WhenDataIsNotValid_RetursNil() {
    let encodable = ModelMock(name: "Infinity", id: .infinity)
    let result = encodable.dictionary(with: JSONEncoder())
    XCTAssertNil(result)
  }
}
