//
//  LoginAvalible.swift
//  AuthCore#iphonesimulator-x86_64
//
//  Created by nedstar on 18.06.2020.
//

public struct LoginAvalible {
  public let result: Bool
  
  public init(result: Bool) {
    self.result = result
  }
}

extension LoginAvalible: Codable, Hashable {
  enum CodingKeys: String, CodingKey {
    case result
  }
}
