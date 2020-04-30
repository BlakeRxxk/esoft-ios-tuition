//
//  URLComponents+QueryParams.swift
//  Network
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation

extension URLComponents {
  mutating func setQueryParams(_ params: [String: Any?],
                               queryStringTypeConverter: NetworkAPITypeConverter? = nil) {
    queryItems = (queryItems ?? []) + params
      .compactMapValues { queryStringTypeConverter?($0) ?? $0 }
      .compactMap { URLQueryItem(name: $0, value: "\($1)") }
  }
}
