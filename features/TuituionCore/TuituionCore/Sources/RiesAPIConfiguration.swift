//
//  RiesAPIConfiguration.swift
//  TuituionCore
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation

public struct RiesAPIConfiguration {
  internal let baseURLSring: String = "https://developers.etagi.com/api/"
  
  #if DEBUG
  public let apiKey: String = "demo_lk_ios"
  #else
  public let apiKey: String = "demo_lk_ios"
  #endif
}

extension RiesAPIConfiguration {
  public var baseURL: URL {
    guard let url = URL(string: baseURLSring) else {
      fatalError("RiesAPIConfiguration Error: invalid baseURL")
    }

    return url
  }
}
