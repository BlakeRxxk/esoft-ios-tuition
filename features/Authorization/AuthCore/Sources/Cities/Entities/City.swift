//
//  City.swift
//  AuthCore#iphonesimulator-x86_64
//
//  Created by nedstar on 13.06.2020.
//

import Foundation

public struct City {
  public let id: Int
  public let name: String
  public let coords: String
  public let clockWrap: String?
  public let country: Int
  public let eOfficeId: Int?
  public let created: String
  public let updated: String
  
  public init(id: Int,
              name: String,
              coords: String,
              clockWrap: String?,
              country: Int,
              eOfficeId: Int?,
              created: String,
              updated: String
  ) {
    self.id = id
    self.name = name
    self.coords = coords
    self.clockWrap = clockWrap
    self.country = country
    self.eOfficeId = eOfficeId
    self.created = created
    self.updated = updated
  }
}

extension City: Codable, Hashable {
  enum CodingKeys: String, CodingKey {
    case id
    case name
    case coords
    case clockWrap = "clock_wrap"
    case country
    case eOfficeId = "e_office_id"
    case created
    case updated
  }
}
