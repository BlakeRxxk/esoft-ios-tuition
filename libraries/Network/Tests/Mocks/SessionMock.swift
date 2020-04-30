//
//  SessionMock.swift
//  NetworkTests
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation

class URLSessionDataTaskMock: URLSessionDataTask {
  private let closure: () -> Void
  
  init(closure: @escaping () -> Void) {
    self.closure = closure
  }
  
  override func resume() {
    closure()
  }
  
  override func cancel() {}
}

class URLSessionConfigurationMock: URLSessionConfiguration {
  private var cache: URLCache? = URLCache(memoryCapacity: 5 * 1024 * 1024,
                                          diskCapacity: 5 * 1024 * 1024,
                                          diskPath: "test")
  override var urlCache: URLCache? {
    get {
      cache
    }
    set {
      self.cache = newValue
    }
  }
}

class URLSessionMock: URLSession {
  var data: Data?
  var error: Error?
  var response: URLResponse?
  private let configurationMock = URLSessionConfigurationMock()
  
  override var configuration: URLSessionConfiguration {
    configurationMock
  }
  
  init(data: Data? = nil,
       error: Error? = nil,
       response: URLResponse? = nil) {
    self.data = data
    self.response = response
    self.error = error
  }
  
  override func dataTask(with request: URLRequest,
                         completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
    let data = self.data
    let error = self.error
    let response = self.response
    return URLSessionDataTaskMock {
      completionHandler(data, response, error)
    }
  }
}

extension URLSessionMock {
  static func create(_ json: String, errorCode: Int = 200) -> URLSession {
    let session = URLSessionMock()
    session.data = json.data(using: .utf8)
    session.response = Resources.httpUrlResponse(code: errorCode)
    return session
  }
}
