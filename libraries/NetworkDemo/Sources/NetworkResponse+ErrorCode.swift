//
//  NetworkResponse+ErrorCode.swift
//  Network
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation

extension NetworkResponse {
  // swiftlint:disable:next cyclomatic_complexity
  static func errorCode(_ code: Int) -> NetworkResponse {
    switch code {
    case 400:
      return .badRequest
    case 401:
      return .unauthorized
    case 403:
      return .forbidden
    case 404:
      return .notFound
    case 408:
      return .requestTimeout
    case 415:
      return .unsupportedMediaType
    case 423:
      return .locked
    case 451:
      return .unavailableForLegalReasons
    case 500:
      return .internalServerError
    case 501:
      return .notImplemented
    case 502:
      return .badGateway
    case 503:
      return .serviceUnavailable
    case 504:
      return .gatewayTimeout
    case 999:
      return .parsingError
    case 1000:
      return .unreachable
    case 1001:
      return .none
    case 1002:
      return .badURL
    default:
      return .unknown
    }
  }
}
