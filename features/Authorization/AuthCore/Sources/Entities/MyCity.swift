//
//  MyCity.swift
//  AuthCore#iphonesimulator-x86_64
//
//  Created by nedstar on 13.06.2020.
//

import Foundation

public struct MyCity {
  public let id: String
  public let name: String
  public let distance: Int
  
  public init(id: String,
              name: String,
              distance: Int
  ) {
    self.id = id
    self.name = name
    self.distance = distance
  }
}

extension MyCity: Codable, Hashable {
  enum CodingKeys: String, CodingKey {
    case id
    case name
    case distance
  }
}
