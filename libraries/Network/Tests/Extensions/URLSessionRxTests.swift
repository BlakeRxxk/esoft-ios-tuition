//
//  URLSessionRxTests.swift
//  NetworkTests
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//
//
//import XCTest
//import RxSwift
//import RxBlocking
//import Network
//
//class URLSessionRxTests: XCTestCase {
//  func test_Fetch_When200_DataIsValid() {
//    let session = URLSessionMock.create(Resources.json)
//    do {
//      let response = try session.rx.fetch(Resources.urlRequest)
//        .toBlocking()
//        .single()
//      
//      XCTAssertNotNil(response)
//    } catch {
//      XCTFail(error.localizedDescription)
//    }
//  }
//
//  func test_Fetch_When500_ReturnError() {
//    let session = URLSessionMock.create(Resources.json, errorCode: 500)
//    let response = session.rx.fetch(Resources.urlRequest)
//      .toBlocking()
//      .materialize()
//
//    switch response {
//    case .completed(elements: _):
//      XCTFail("This should throws an error!")
//    case .failed(elements: _, error: let error):
//      if case let NetworkAPIError.httpError(request: _, response: response, data: _) = error {
//        XCTAssertTrue(response.statusCode == 500)
//      } else {
//        XCTFail("This should be a NetworkAPIError.httpError")
//      }
//    }
//  }
//
//  func test_Fetch_When401_ReturnError() {
//    let session = URLSessionMock.create(Resources.json, errorCode: 401)
//    let response = session.rx.fetch(Resources.urlRequest)
//      .toBlocking()
//      .materialize()
//
//    switch response {
//    case .completed(elements: _):
//      XCTFail("This should throws an error!")
//    case .failed(elements: _, error: let error):
//      if case let NetworkAPIError.httpError(request: _, response: response, data: _) = error {
//        XCTAssertTrue(response.statusCode == 401)
//      } else {
//        XCTFail("This should be a NetworkAPIError.httpError")
//      }
//    }
//  }
//
//  func test_Fetch_WhenDataNil_UnknownError() {
//    let session = URLSessionMock(response: Resources.httpUrlResponse())
//    let response = session.rx.fetch(Resources.urlRequest)
//      .toBlocking()
//      .materialize()
//
//    switch response {
//    case .completed(elements: _):
//      XCTFail("This should throws an error!")
//    case .failed(elements: _, error: let error):
//      if case NetworkAPIError.unknown = error {
//        XCTAssertNotNil(error)
//      } else {
//        XCTFail("This should be a NetworkAPIError.unknown")
//      }
//    }
//  }
//
//  func test_Fetch_WhenResponseNil_UnknownError() {
//    let session = URLSessionMock(data: Resources.json.data(using: .utf8))
//    let response = session.rx.fetch(Resources.urlRequest)
//      .toBlocking()
//      .materialize()
//
//    switch response {
//    case .completed(elements: _):
//      XCTFail("This should throws an error!")
//    case .failed(elements: _, error: let error):
//      if case NetworkAPIError.unknown = error {
//        XCTAssertNotNil(error)
//      } else {
//        XCTFail("This should be a NetworkAPIError.unknown")
//      }
//    }
//  }
//
//  func test_Fetch_WhenResponseIsNotHTTP_NonHttpResponse() {
//    let session = URLSessionMock(data: Data(), response: URLResponse())
//    let response = session.rx.fetch(Resources.urlRequest)
//      .toBlocking()
//      .materialize()
//
//    switch response {
//    case .completed(elements: _):
//      XCTFail("This should throws an error!")
//    case .failed(elements: _, error: let error):
//      if case NetworkAPIError.nonHttpResponse(response: _) = error {
//        XCTAssertNotNil(error)
//      } else {
//        XCTFail("This should be a NetworkAPIError.nonHttpResponse")
//      }
//    }
//  }
//
//  func test_Fetch_Interceptors() {
//    let intercetors = Array(repeating: InterceptorMock(), count: 6)
//    let session = URLSessionMock.create(Resources.json)
//    do {
//      let response = try session.rx.fetch(Resources.urlRequest, interceptors: intercetors)
//        .toBlocking()
//        .single()
//
//      XCTAssertNotNil(response)
//      XCTAssertNotNil(response.request.allHTTPHeaderFields)
//      XCTAssertEqual(response.request.allHTTPHeaderFields?.count, intercetors.count)
//    } catch {
//      XCTFail(error.localizedDescription)
//    }
//  }
//}
