//
//  Country.swift
//  Authorization#iphonesimulator-x86_64
//
//  Created by nedstar on 26.05.2020.
//

import Foundation

public struct Country {
  public let id: Int
  public let name: String
  public let cities: [City]
  
  public init(id: Int,
              name: String,
              cities: [City]) {
    self.id = id
    self.name = name
    self.cities = cities
  }
}

extension Country: Codable, Hashable {
  enum CodingKeys: String, CodingKey {
    case id
    case name
    case cities
  }
}
