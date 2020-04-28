//
//  NetworkAPIErrorTests.swift
//  NetworkTests
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import XCTest
import Network

class NetworkAPIErrorTests: XCTestCase {
  private enum CodingKeys: String, CodingKey { case test }
  private static let context = DecodingError.Context(codingPath: [], debugDescription: "Value not found.")
  
  private let keyNotFound = DecodingError.keyNotFound(CodingKeys.test, NetworkAPIErrorTests.context)
  private let typeMismatch = DecodingError.typeMismatch(ModelMock.self, NetworkAPIErrorTests.context)
  private let dataCorrupted = DecodingError.dataCorrupted(NetworkAPIErrorTests.context)
  
  private let urlComponentsError = NetworkAPIError.URLComponentsError(Resources.url)
  private let httpError = NetworkAPIError.httpError(request: Resources.urlRequest, response: Resources.httpUrlResponse(code: 500)!, data: Resources.data)
  
  func test_ErrorDescription() {
    XCTAssertNil(urlComponentsError.errorDescription)
    XCTAssertNil(httpError.errorDescription)
    let description = NetworkAPIError.decodingError(dataCorrupted, data: Resources.data).errorDescription
    XCTAssertNotNil(description)
    XCTAssertEqual(description, dataCorrupted.localizedDescription)
  }
  
  func test_FailureReason() {
    XCTAssertNil(urlComponentsError.failureReason)
    XCTAssertNil(httpError.failureReason)
    
    let keyNotFoundReason = NetworkAPIError.decodingError(keyNotFound, data: Resources.data).failureReason
    XCTAssertNotNil(keyNotFoundReason)
    XCTAssertEqual(keyNotFoundReason, "root.test: Not Found!")
    
    let typeMismatchReason = NetworkAPIError.decodingError(typeMismatch, data: Resources.data).failureReason
    XCTAssertNotNil(typeMismatchReason)
    XCTAssertEqual(typeMismatchReason, "root: Value not found.")
    
    let dataCorruptedReason = NetworkAPIError.decodingError(dataCorrupted, data: Resources.data).failureReason
    XCTAssertEqual(dataCorruptedReason, "root: Value not found.")
  }
}
