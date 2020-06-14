//
//  City.swift
//  Authorization#iphonesimulator-x86_64
//
//  Created by nedstar on 26.05.2020.
//

import Foundation

public struct City {
  public let id: Int
  public let name: String
  public let regions: [String]?
  public let isComingSoon: Bool
  
  public init(id: Int,
              name: String,
              regions: [String]? = nil,
              isComingSoon: Bool = false) {
    self.id = id
    self.name = name
    self.regions = regions
    self.isComingSoon = isComingSoon
  }
  
  public init(from decoder: Decoder) throws {
    fatalError("init(decoder:) has not been implemented")
  }
}

extension City: Codable, Hashable {
  enum CodingKeys: String, CodingKey {
    case id
    case name
    case regions
  }
}
