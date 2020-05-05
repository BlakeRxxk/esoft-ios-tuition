//
//  CacheMock.swift
//  NetworkTests
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation
import Network

struct CacheMock: NetworkAPICache {
  public func cache(_ response: HTTPURLResponse,
                    request: URLRequest,
                    data: Data) -> CachedURLResponse? {
    guard let url = response.url, let newResponse = HTTPURLResponse(url: url,
                                                                    statusCode: response.statusCode,
                                                                    httpVersion: "HTTP/1.1",
                                                                    headerFields: nil) else { return nil }
    
    return CachedURLResponse(response: newResponse, data: data)
  }
}
