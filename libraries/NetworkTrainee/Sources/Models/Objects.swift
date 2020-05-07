//
//  Objects.swift
//  NetworkTrainee#iphonesimulator-x86_64
//
//  Created by Алексей Макаров on 07.05.2020.
//

import Foundation

public struct Objects {
  public let id: String
  public let description: String
  
  public init(id: String, description: String) {
    self.id = id
    self.description = description
  }
}

extension Objects: Codable, Hashable {
  enum CodingKeys: String, CodingKey {
    case id
    case description
  }
}
