//
//  District.swift
//  NetworkTrainee
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation

public struct District {
  public let id: Int
  public let name: String
  
  public init(id: Int, name: String) {
    self.id = id
    self.name = name
  }
}

extension District: Codable, Hashable {
  enum CodingKeys: String, CodingKey {
    case id
    case name
  }
}
