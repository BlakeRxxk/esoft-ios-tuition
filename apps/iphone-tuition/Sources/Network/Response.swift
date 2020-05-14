//
//  Response.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation

public struct Response<T: Codable & Hashable> {
  public let success: Bool
  public let status: Int
  public let data: T?
  
  public init(success: Bool,
              status: Int,
              data: T?) {
    self.success = success
    self.status = status
    self.data = data
  }
}

extension Response: Codable, Hashable {
  enum CodingKeys: String, CodingKey {
    case success
    case status
    case data
  }

  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    success = try container.decode(Bool.self, forKey: .success)
    status = try container.decode(Int.self, forKey: .status)
    data = try container.decode(T.self, forKey: .data)
  }
}
