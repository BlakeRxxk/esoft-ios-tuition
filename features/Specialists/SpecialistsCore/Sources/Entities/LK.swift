//
//  LK.swift
//  SpecialistsCore
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation

public struct LK {
  public var id: Int
  
  public init(id: Int) {
    self.id = id
  }
}

extension LK: Codable, Hashable {
  enum CodingKeys: String, CodingKey {
    case id
  }
}
