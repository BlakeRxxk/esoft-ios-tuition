//
//  NetworkAPITests.swift
//  NetworkTests
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import XCTest
import RxSwift

@testable import Network

class NetworkAPITests: XCTestCase {
  private let session = URLSession(configuration: URLSessionConfiguration.default)
  
  private var api: NetworkAPI {
    NetworkAPI(session: session.rx,
                      baseUrl: Resources.baseUrl)
  }
  
  func test_Init_NetworkAPI() {
    XCTAssertEqual(api.session.base, session)
    XCTAssertNotNil(api.decoder)
  }
  
  func test_AbsoluteURL_AppendsEndpoint() {
    let url = api.absoluteURL("path")
    XCTAssertEqual(url.absoluteString, "http://www.mock.com/path")
  }
  
  func test_AbsoluteURL_AppendsEmptyEndpoint() {
    let url = api.absoluteURL("")
    XCTAssertEqual(url.absoluteString, "http://www.mock.com/")
  }
}
