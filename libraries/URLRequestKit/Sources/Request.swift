//
//  Request.swift
//  URLRequestKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation

public struct Request {
  private var params: CombinedParams

  public var absoluteString: String {
    guard var components = URLComponents(string: params.children!.filter { $0.type == .endpoint }[0].value as! String) else {
      fatalError("Missing Endpoint in Request body")
    }
    
    // Query, QueryParam
    let query = params.children!.filter { $0.type == .query }.reduce([QueryParam]()) { prev, param in
      if param.children != nil {
        return prev + (param.children as! [QueryParam])
      } else {
        return prev + ([param] as! [QueryParam])
      }
    }
    components.queryItems = query.map { param in
      URLQueryItem(name: param.key!, value: param.value as? String)
    }
    
    // BUILD REQUEST
    let request = URLRequest(url: components.url!)
    
    return request.url?.absoluteString ?? ""
  }
  
  public init(@RequestBuilder builder: () -> RequestParam) {
    let params = builder()
    if !(params is CombinedParams) {
      self.params = CombinedParams(children: [params])
    } else {
      self.params = builder() as! CombinedParams
    }
  }
}
