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
  public let price: String
  public let oldPrice: String?
  public let city: String
  public let district: String
  public let street: String
  public let house: String
  public let type: String
  public let roomsCount: String
  public let areaFlat: String
  public let floorsNum: String
  public let floorsCnt: String 
  public let priceAr: String
  public let photos: [ObjectPhotos]
  public let viewsCount: String?
  public let isFavorite: String?
}

public struct ObjectPhotos {
  public let fileName: String
}

extension Objects: Codable, Hashable {
  enum CodingKeys: String, CodingKey {
    case id
    case description
    case price
    case oldPrice = "old_price"
    case city
    case district
    case street
    case house
    case type
    case roomsCount = "rooms_count"
    case areaFlat = "area_flat"
    case floorsNum = "floors_num"
    case floorsCnt = "floors_cnt"
    case priceAr = "price_ar"
    case photos
    case viewsCount = "views_count"
    case isFavorite = "is_favorite"
  }
}

extension ObjectPhotos: Codable, Hashable {
  enum CodingKeys: String, CodingKey {
    case fileName = "file_name"
  }
}
