//
//  ObjectsViewModel.swift
//  EsoftUIKit
//
//  Created by Алексей Макаров on 28.05.2020.
//

import Foundation
import IGListKit
import ListKit
import SpecialistsCore

public final class ObjectsViewModel {
  
  public let id: String
  public let price: String
  public let oldPrice: String
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
  public let viewsCount: String
  public let isFavorite: String
  public let photos: [String]
  public let rating: String
  public let isViewed: Bool
  public let phone: String
  
  public var address: String {
    "\(city), \(district), \(street), \(house)"
  }
  
  public var objectsDescription: String {
    "\(typeFlat(type)), \(roomsCount)-комн, \(Int(Float(areaFlat)!)) м², этаж \(floorsNum)/\(floorsCnt), \(zeroPadding(priceAr)!) руб./м²"
  }
  
  // определение типа
  private func typeFlat(_ type: String) -> String {
    switch type {
    case "flat":
      return "Квартира"
    case "pansion":
      return "Пансионат"
    default:
      return ""
    }
  }
  
  private func zeroPadding(_ toString: String) -> String? {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.groupingSeparator = " "
    guard let float = Float(toString) else { return nil }
    let aStr = String(format: "%.0f", float)
    guard let number = formatter.number(from: aStr) else {
      return nil
    }
    return formatter.string(from: number)
  }
  
  public init(id: String,
              price: String,
              oldPrice: String,
              city: String,
              district: String,
              street: String,
              house: String,
              type: String,
              roomsCount: String,
              areaFlat: String,
              floorsNum: String,
              floorsCnt: String,
              priceAr: String,
              viewsCount: String,
              isFavorite: String,
              photos: [String],
              rating: String,
              isViewed: Bool,
              phone: String) {
    self.id = id
    self.price = price
    self.oldPrice = oldPrice
    self.city = city
    self.district = district
    self.street = street
    self.house = house
    self.type = type
    self.roomsCount = roomsCount
    self.areaFlat = areaFlat
    self.floorsNum = floorsNum
    self.floorsCnt = floorsCnt
    self.priceAr = priceAr
    self.viewsCount = viewsCount
    self.isFavorite = isFavorite
    self.photos = photos
    self.rating = rating
    self.isViewed = isViewed
    self.phone = phone
  }
}

extension ObjectsViewModel: ListDiffable {
  public func diffIdentifier() -> NSObjectProtocol {
    id as NSObjectProtocol
  }
  
  public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    guard self !== object else { return true }
    guard let object = object as? ObjectsViewModel else { return false }
    return id == object.id
  }
}

extension ObjectsViewModel: Equatable {
  public static func == (lhs: ObjectsViewModel, rhs: ObjectsViewModel) -> Bool {
    lhs.id == rhs.id
  }
}
