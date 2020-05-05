//
//  NetworkAPIError.swift
//  Network
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation

private func reduce(_ codingKeys: [CodingKey]) -> String {
  codingKeys.reduce("root") { accumulator, key in
    accumulator + (key.intValue.map { "[\($0)]" } ?? ".\(key.stringValue)")
  }
}

public enum NetworkAPIError: Error {
  case decodingError(_ underlyingError: DecodingError, data: Data)
  case URLComponentsError(URL)
  case httpError(request: URLRequest, response: HTTPURLResponse, data: Data)
  case nonHttpResponse(response: URLResponse)
  case unknown
}

extension NetworkAPIError: LocalizedError {
  public var errorDescription: String? {
    switch self {
    case .decodingError(let underlyingError, _):
      return underlyingError.localizedDescription
    default:
      return nil
    }
  }
  
  public var failureReason: String? {
    switch self {
    case .decodingError(let underlyingError, _):
      switch underlyingError {
      case DecodingError.keyNotFound(let key, let context):
        let fullPath = context.codingPath + [key]
        return "\(reduce(fullPath)): Not Found!"
      case DecodingError.typeMismatch(_, let context),
           DecodingError.valueNotFound(_, let context),
           DecodingError.dataCorrupted(let context):
        return "\(reduce(context.codingPath)): \(context.debugDescription)"
      default:
        return underlyingError.failureReason
      }
    default:
      return nil
    }
  }
}
