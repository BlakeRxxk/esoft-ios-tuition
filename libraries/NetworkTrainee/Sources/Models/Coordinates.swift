//
//  Coordinates.swift
//  NetworkTrainee
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation

public struct Coordinates {
  var id: Int
  var lat: Float
  var lng: Float

  init(id: Int, lat: Float, lng: Float) {
    self.id = id
    self.lat = lat
    self.lng = lng
  }

  init(coordinates: String) {
    let coords = coordinates.split(separator: ",", omittingEmptySubsequences: true)
    self.lat = Float(coords[0].trimmingCharacters(in: .whitespaces)) ?? 0.0
    self.lng = Float(coords[1].trimmingCharacters(in: .whitespaces)) ?? 0.0
  }
}

extension Coordinates: Codable {

}

extension Coordinates: Equatable {

}

extension Coordinates: Hashable {

}
