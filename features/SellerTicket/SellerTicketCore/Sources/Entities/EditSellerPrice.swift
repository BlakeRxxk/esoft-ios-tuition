//
//  EditSellerPrice.swift
//  SellerTicketCore#iphonesimulator-x86_64
//
//  Created by wtildestar on 16/06/2020.
//

public struct RecomendedPrice {
  public let id: String
  public let price: String
  
  public init(price: String,
              id: String) {
    self.id = id
    self.price = price
  }
}

extension RecomendedPrice: Codable, Hashable {
  enum CodingKeys: String, CodingKey {
    case id
    case price
  }
}
