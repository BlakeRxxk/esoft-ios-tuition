//
//  Coordinates.swift
//  LoyaltyCore
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation

public struct Coordinates {
  // Tyumen
  var lat: Float = 57.1486
  var lng: Float = 65.5333

  public init() {}

  public init(lat: Float, lng: Float) {
    self.lat = lat
    self.lng = lng
  }

  public init(coordinates: String?) {
    guard coordinates != nil else { return }
    let coordsWithoutSpaces = coordinates!.replacingOccurrences(of: " ", with: "", options: NSString.CompareOptions.literal, range: nil)
    let coords = coordsWithoutSpaces.split(separator: ",", omittingEmptySubsequences: true)
    self.lat = Float(coords[0].trimmingCharacters(in: .whitespaces)) ?? 0.0
    self.lng = Float(coords[1].trimmingCharacters(in: .whitespaces)) ?? 0.0
  }

  public func asString() -> String {
    "\(lat),\(lng)"
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
