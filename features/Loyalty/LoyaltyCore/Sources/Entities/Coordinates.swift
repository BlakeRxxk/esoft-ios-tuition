//
//  Coordinates.swift
//  LoyaltyCore
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation

public struct Coordinates {
  var lat: Float
  var lng: Float

  init(lat: Float, lng: Float) {
    self.lat = lat
    self.lng = lng
  }

  init(coordinates: String) {
    let coords = coordinates.split(separator: ",", omittingEmptySubsequences: true)
    self.lat = Float(coords[0].trimmingCharacters(in: .whitespaces)) ?? 0.0
    self.lng = Float(coords[1].trimmingCharacters(in: .whitespaces)) ?? 0.0
  }
}

extension Coordinates: Codable, Hashable {
  enum CodingKeys: String, CodingKey {
    case lat
    case lng
  }

  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    lat = try container.decode(Float.self, forKey: .lat) ?? 0
    lng = try container.decode(Float.self, forKey: .lng) ?? 0
  }
}

extension Coordinates: Equatable {
  public static func == (lhs: Coordinates, rhs: Coordinates) -> Bool {
    lhs.lat == rhs.lat && lhs.lng == rhs.lng
  }
}
