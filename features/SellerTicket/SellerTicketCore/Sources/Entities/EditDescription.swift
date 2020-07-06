//
//  EditDescription.swift
//  SellerTicketCore#iphonesimulator-x86_64
//
//  Created by wtildestar on 25/06/2020.
//

public struct Desc {
  public let desc: [String]
  
  public init(desc: [String]) {
    self.desc = desc
  }
}

extension Desc: Codable, Hashable {
  enum CodingKeys: String, CodingKey {
    
    case desc
  }
}
