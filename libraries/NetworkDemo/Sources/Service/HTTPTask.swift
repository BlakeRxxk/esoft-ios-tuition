//
//  HTTPTask.swift
//  Network
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation

public typealias HTTPHeaders = [String: String]

public enum HTTPTask {
  case request
  
  case requestParameters(bodyParameters: Parameters?,
    bodyEncoding: ParameterEncoding,
    urlParameters: Parameters?)
  
  case requestParametersAndHeaders(bodyParameters: Parameters?,
    bodyEncoding: ParameterEncoding,
    urlParameters: Parameters?,
    additionHeaders: HTTPHeaders?)
  
  // case download, upload...etc
}
