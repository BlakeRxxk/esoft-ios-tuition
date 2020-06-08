//
//  SellerTicket.swift
//  NetworkTrainee#iphonesimulator-x86_64
//
//  Created by wtildestar on 07/05/2020.
//

import Foundation

public struct SellerTicket {
  public let id: String
  public let price: String
  public let photos: [Photos]
  
//  public init(id: String,
//              price: String,
//              photos: [Photos]) {
//    self.id = id
//    self.price = price
//    self.photos = photos
//  }
}

extension SellerTicket: Codable, Hashable {
  enum CodingKeys: String, CodingKey {
    case id
    case price
    case photos
  }
  
  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    id = try container.decode(String.self, forKey: .id)
    price = try container.decode(String.self, forKey: .price)
    photos = try container.decode([Photos].self, forKey: .photos)
  }
}

public struct Photos {
  public let objectId: String
  public let fileName: String
//
//  public init(objectId: String,
//              fileName: String) {
//    self.objectId = objectId
//    self.fileName = fileName
//  }
}

extension Photos: Codable, Hashable {
  enum CodingKeys: String, CodingKey {
    case objectId = "object_id"
    case fileName = "file_name"
  }

//  public init(from decoder: Decoder) throws {
//    let container = try decoder.container(keyedBy: CodingKeys.self)
//
//    objectId = try container.decode(String.self, forKey: .objectId)
//    fileName = try container.decode(String.self, forKey: .fileName)
//  }
}


