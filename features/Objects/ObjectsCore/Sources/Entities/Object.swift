//
//  Objects.swift
//  ObjectsCore#iphonesimulator-x86_64
//
//  Created by Алексей Макаров on 26.05.2020.
//

import Foundation

public struct Object {
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
  public let photosUrl: [ObjectPhotos]?
  public let viewsCount: String?
  public let isFavorite: String?
  public let rating: String
  // добавить рейтинг rating
}

extension Object: Codable, Hashable {
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
    case photosUrl = "photos"
    case viewsCount = "views_count"
    case isFavorite = "is_favorite"
    case rating
  }
}
