//
//  Resources.swift
//  NetworkTests
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation

struct Resources {
  static let url = URL(string: "https://url.com")!
  static let baseUrlHost = "www.mock.com"
  static let baseUrl = URL(string: "http://\(Resources.baseUrlHost)/")!
  static let urlRequest = URLRequest(url: Resources.url)
  static let data = Data(count: 100)
  static let params: [String: Any?] = ["key": "value",
                                       "number": 3,
                                       "nil": nil]
  static let json = """
        [ { "beautiful": "json" } ]
        """
  static let jsonResponse: String = """
        { "name": "Patrick", "id": 5 }
        """
  static let jsonInvalidResponse: String = """
        { "name": "Patrick", "id": "id" }
        """
  
  static func httpUrlResponse(code: Int = 200) -> HTTPURLResponse? {
    HTTPURLResponse(url: Resources.url,
                           statusCode: code,
                           httpVersion: nil,
                           headerFields: nil)
  }
}
