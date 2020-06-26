//
//  EditSellerPrice.swift
//  SellerTicketCore#iphonesimulator-x86_64
//
//  Created by wtildestar on 16/06/2020.
//

public struct RecomendedPrice {
  public let objectPrice: [ObjectPrice]
}

extension RecomendedPrice: Codable, Hashable {
  enum CodingKeys: String, CodingKey {
    
    case objectPrice = "object_price"
  }
}

public struct ObjectPrice {
  public let price: String
  
  public init(price: String) {
    self.price = price
  }
}

extension ObjectPrice: Codable, Hashable {
  enum CodingKeys: String, CodingKey {
    case price
  }
}


