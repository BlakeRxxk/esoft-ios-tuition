//
//  ObjectsViewModel.swift
//  EsoftUIKit
//
//  Created by Алексей Макаров on 28.05.2020.
//

import Foundation
import IGListKit
import ListKit

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
              isFavorite: String) {
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
  }
}

public struct ObjectPhotos {
  public let fileName: String
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
