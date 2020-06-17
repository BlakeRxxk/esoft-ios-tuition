//
//  CountriesRequest.swift
//  AuthCore#iphonesimulator-x86_64
//
//  Created by nedstar on 13.06.2020.
//

import Foundation

public struct CountriesRequest {
  public var query: String?
  
  public init(query: String = "") {
    self.query = query
  }
}
