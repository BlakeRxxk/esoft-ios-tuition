//
//  MyCityRequest.swift
//  AuthCore#iphonesimulator-x86_64
//
//  Created by nedstar on 15.06.2020.
//

import Foundation

public typealias Coords = (Double, Double)

public struct MyCityRequest {
  
  public var coords: Coords
  public var query: String?
  
  public init(coords: Coords, query: String = "") {
    self.coords = coords
    self.query = query
  }
}
