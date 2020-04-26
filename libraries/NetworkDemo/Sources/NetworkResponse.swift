//
//  NetworkResponse.swift
//  Network
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation

enum NetworkResponse: LocalizedError, Equatable {
  case none
  case badRequest
  case unauthorized
  case forbidden
  case notFound
  case requestTimeout
  case unsupportedMediaType
  case locked
  case unavailableForLegalReasons
  
  case internalServerError
  case notImplemented
  case badGateway
  case serviceUnavailable
  case gatewayTimeout
  
  case parsingError
  case badURL
  case unreachable
  case unknown
  
  var localizedDescription: String {
    switch self {
    case .none:
      return "none"
    case .badRequest:
      return "badRequest"
    case .unauthorized:
      return "unauthorized"
    case .forbidden:
      return "forbidden"
    case .notFound:
      return "notFound"
    case .requestTimeout:
      return "requestTimeout"
    case .unsupportedMediaType:
      return "unsupportedMediaType"
    case .locked:
      return "locked"
    case .unavailableForLegalReasons:
      return "unavailableForLegalReasons"
    case .internalServerError:
      return "internalServerError"
    case .notImplemented:
      return "notImplemented"
    case .badGateway:
      return "badGateway"
    case .serviceUnavailable:
      return "serviceUnavailable"
    case .gatewayTimeout:
      return "gatewayTimeout"
    case .parsingError:
      return "parsingError"
    case .unreachable:
      return "unreachable"
    case .badURL:
      return "badURL"
    case .unknown:
      return "unknown"
    }
  }
}
