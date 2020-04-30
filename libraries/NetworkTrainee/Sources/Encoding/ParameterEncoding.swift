//
//  ParameterEncoding.swift
//  Network
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation

public typealias Parameters = [String: Any]

public protocol ParameterEncoder {
  func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}

public enum NetworkError: String, Error {
  case parametersNil = "Parameters were nil."
  case encodingFailed = "Parameter encoding failed."
  case missingURL = "URL is nil."
}

public enum ParameterEncoding {
  case urlEncoding
  case jsonEncoding
  case urlAndJsonEncoding
  
  public func encode(urlRequest: inout URLRequest,
                     bodyParameters: Parameters?,
                     urlParameters: Parameters?) throws {
    do {
      switch self {
      case .urlEncoding:
        guard let urlParameters = urlParameters else { return }
        try URLEncoder().encode(urlRequest: &urlRequest, with: urlParameters)
        
      case .jsonEncoding:
        guard let bodyParameters = bodyParameters else { return }
        try JSONEncoder().encode(urlRequest: &urlRequest, with: bodyParameters)
        
      case .urlAndJsonEncoding:
        guard let bodyParameters = bodyParameters,
          let urlParameters = urlParameters else { return }
        try URLEncoder().encode(urlRequest: &urlRequest, with: urlParameters)
        try JSONEncoder().encode(urlRequest: &urlRequest, with: bodyParameters)
        
      }
    } catch {
      throw error
    }
  }
}
