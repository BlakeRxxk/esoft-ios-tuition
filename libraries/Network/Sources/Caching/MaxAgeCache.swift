//
//  MaxAgeCache.swift
//  Network
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation

public final class MaxAgeCache: NetworkAPICache {
  private let maxAge: Int
  
  public init(maxAge: Int) {
    self.maxAge = maxAge
  }
  
  public func cache(_ response: HTTPURLResponse,
                    request: URLRequest,
                    data: Data) -> CachedURLResponse? {
    guard request.httpMethod == NetworkAPIHTTPMethod.get.rawValue,
      var headers = response.allHeaderFields as? [String: String],
      let url = response.url else { return nil }
    
    headers["Cache-Control"] = "public, max-age=\(maxAge)"
    headers.removeValue(forKey: "Expires")
    
    guard let newResponse = HTTPURLResponse(url: url,
                                            statusCode: response.statusCode,
                                            httpVersion: "HTTP/1.1",
                                            headerFields: headers) else { return nil }
    
    return CachedURLResponse(response: newResponse,
                             data: data)
  }
}
