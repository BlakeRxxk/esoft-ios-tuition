//
//  PasswordRequest.swift
//  AuthCore#iphonesimulator-x86_64
//
//  Created by nedstar on 18.06.2020.
//

import Foundation

public struct PasswordRequest {
  public var password: String
  public var query: String?
  
  public init(_ password: String,
              query: String = "") {
    self.password = password
    self.query = query
  }
}
