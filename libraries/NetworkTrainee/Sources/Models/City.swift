//
//  City.swift
//  NetworkTrainee
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation

public struct City {
  public let id: Int
  public let name: String
  public let coords: String?
  public let clockWrap: String?
  public let country: Int
  public let eOfficeID: Int?
  public let created: String
  public let updated: String
  
  public init(id: Int,
              name: String,
              coords: String,
              clockWrap: String?,
              country: Int,
              eOfficeID: Int?,
              created: String,
              updated: String) {
    self.id = id
    self.name = name
    self.coords = coords
    self.clockWrap = clockWrap
    self.country = country
    self.eOfficeID = eOfficeID
    self.created = created
    self.updated = updated
  }
}

extension City: Codable, Hashable {
  enum CodingKeys: String, CodingKey {
    case id = "id"
    case name = "name"
    case coords = "coords"
    case clockWrap = "clock_wrap"
    case country = "country"
    case eOfficeID = "e_office_id"
    case created = "created"
    case updated = "updated"
  }
  
  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    id = try container.decode(Int.self, forKey: .id)
    name = try container.decode(String.self, forKey: .name)
    coords = try? container.decode(String.self, forKey: .coords) ?? nil
    clockWrap = try? container.decode(String.self, forKey: .clockWrap) ?? nil
    country = try container.decode(Int.self, forKey: .country)
    eOfficeID = try? container.decode(Int.self, forKey: .eOfficeID) ?? nil
    created = try container.decode(String.self, forKey: .created)
    updated = try container.decode(String.self, forKey: .updated)
  }
}
