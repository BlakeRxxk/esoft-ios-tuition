//
//  County.swift
//  AuthCore#iphonesimulator-x86_64
//
//  Created by nedstar on 13.06.2020.
//

import Foundation

public struct Country {
  public let id: Int
  public let name: String
  public let currency: Int
  public let countryCode: String?
  
  public init(id: Int,
              name: String,
              currency: Int,
              countryCode: String?)
  {
    self.id = id
    self.name = name
    self.currency = currency
    self.countryCode = countryCode
  }
}

extension Country: Codable, Hashable {
  enum CodingKeys: String, CodingKey {
    case id
    case name
    case currency
    case countryCode = "country_code"
  }
}
