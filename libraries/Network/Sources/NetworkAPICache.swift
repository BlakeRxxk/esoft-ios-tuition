//
//  NetworkAPICache.swift
//  Network
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation

public protocol NetworkAPICache {
  func cache(_ response: HTTPURLResponse,
             request: URLRequest,
             data: Data) -> CachedURLResponse?
}
