//
//  URLRequestTests.swift
//  NetworkTests
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import XCTest
@testable import Network

class URLRequestTests: XCTestCase {
  func test_SetHeaders_WhenDictionaryIsValid_SetHTTPHeaderFields() {
    var request = Resources.urlRequest
    request.setHeaders(Resources.params)
    XCTAssert(request.allHTTPHeaderFields?.count == 2)
    XCTAssertEqual(request.allHTTPHeaderFields, ["key": "value",
                                                 "number": "3"])
  }
  
  func test_createForJSON_WhenGetParamsAreValid_ReturnRequest() {
    do {
      let request = try URLRequest.createForJSON(with: Resources.url,
                                                 method: .get,
                                                 headers: Resources.params,
                                                 queryParams: Resources.params,
                                                 bodyParams: Resources.params,
                                                 queryStringTypeConverter: nil)
      XCTAssertNotNil(request)
      XCTAssertEqual(request.httpMethod, "GET")
      XCTAssertEqual(request.allHTTPHeaderFields, ["key": "value",
                                                   "number": "3",
                                                   "Accept": "application/json"])
    } catch {
      XCTFail(error.localizedDescription)
    }
  }
  
  func test_createForJSON_WhenPatchParamsAreValid_ReturnRequest() {
    do {
      let request = try URLRequest.createForJSON(with: Resources.url,
                                                 method: .patch,
                                                 headers: Resources.params,
                                                 queryParams: Resources.params,
                                                 bodyParams: Resources.params,
                                                 queryStringTypeConverter: nil)
      XCTAssertNotNil(request)
      XCTAssertEqual(request.httpMethod, "PATCH")
      XCTAssertEqual(request.allHTTPHeaderFields, ["Accept": "application/json",
                                                   "number": "3",
                                                   "Content-Type": "application/json",
                                                   "key": "value"])
      
      let bodyDict = try JSONSerialization.jsonObject(with: request.httpBody!, options: []) as? [String: Any]
      XCTAssert(bodyDict!.count == 2)
      XCTAssertEqual(bodyDict!["number"] as! Int, 3)
      XCTAssertEqual(bodyDict!["key"] as! String, "value")
      
    } catch {
      XCTFail(error.localizedDescription)
    }
  }
  
  func test_createForJSON_WhenPutParamsAreValid_ReturnRequest() {
    do {
      let body = ModelMock(name: "Sophia", id: 123)
      let request = try URLRequest.createForJSON(with: Resources.url,
                                                 method: .put,
                                                 body: body,
                                                 encoder: JSONEncoder(),
                                                 queryStringTypeConverter: nil)
      XCTAssertNotNil(request)
      
      let bodyDict = try JSONSerialization.jsonObject(with: request.httpBody!, options: []) as? [String: Any]
      XCTAssert(bodyDict!.count == 2)
      XCTAssertEqual(bodyDict!["id"] as! Double, 123)
      XCTAssertEqual(bodyDict!["name"] as! String, "Sophia")
      
    } catch {
      XCTFail(error.localizedDescription)
    }
  }
}
