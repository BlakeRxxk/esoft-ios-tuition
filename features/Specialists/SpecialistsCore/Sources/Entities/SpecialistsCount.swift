//
//  SpecialistsCount.swift
//  SpecialistsCore
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation

import Foundation

public struct SpecialistsCount {
  public let count: String
  public let countryCode: String
  
  public init(count: String,
              countryCode: String) {
    self.count = count
    self.countryCode = countryCode
  }
}

extension SpecialistsCount: Codable, Hashable {
  enum CodingKeys: String, CodingKey {
    case count
    case countryCode = "country_code"
  }
}
