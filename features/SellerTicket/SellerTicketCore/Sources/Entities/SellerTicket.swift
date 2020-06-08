//
//  SellerTicket.swift
//  AppLibrary
//
//  Created by wtildestar on 23/05/2020.
//

public struct SellerTicket {
  public let id: String
  public let price: String
  public let photos: [Photos]
  
  public init(id: String,
              price: String,
              photos: [Photos]) {
    self.id = id
    self.price = price
    self.photos = photos
  }
}

extension SellerTicket: Codable, Hashable {
  enum CodingKeys: String, CodingKey {
    case id
    case price
    case photos
  }
}

public struct Photos {
  public let objectId: String
  public let fileName: String
}

extension Photos: Codable, Hashable {
  enum CodingKeys: String, CodingKey {
    case objectId = "object_id"
    case fileName = "file_name"
  }
}
