//
//  Login.swift
//  AuthCore#iphonesimulator-x86_64
//
//  Created by nedstar on 20.06.2020.
//

import Foundation

public struct Login {
  public static let id: String = UUID().uuidString
  public let login: String
  
  public init(login: String) {
    self.login = login
  }
}
