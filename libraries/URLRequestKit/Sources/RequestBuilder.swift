//
//  RequestBuilder.swift
//  URLRequestKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation

@_functionBuilder
public struct RequestBuilder {
  public static func buildBlock(_ params: RequestParam...) -> RequestParam {
    let resultParams = params.filter { $0.children == nil } + params.compactMap { $0.children }.joined()
    // Multiple Urls
    if resultParams.filter({ $0.type == .endpoint }).count > 1 {
      fatalError("You cannot specify more than 1 `Endpoint`")
    }
    // Missing Url
    if resultParams.filter({ $0.type == .endpoint }).count < 1 {
      fatalError("You must have a `Endpoint`")
    }
    return CombinedParams(children: resultParams)
  }
  
  public static func buildBlock(_ param: RequestParam) -> RequestParam {
    param
  }
  
  public static func buildIf(_ param: RequestParam?) -> RequestParam {
    if let param = param {
      return param
    }
    return CombinedParams(children: [])
  }
}
