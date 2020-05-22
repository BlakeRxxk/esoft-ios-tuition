//
//  ObjectsViewModel.swift
//  AppLibrary
//
//  Created by Алексей Макаров on 08.05.2020.
//

import Foundation
import IGListKit
import NetworkTrainee

public final class ObjectViewModel {
  let id: String
  let price: String
  let oldPrice: String
  let city: String
  let district: String
  let street: String
  let house: String
  let type: String
  let roomsCount: String
  let areaFlat: String
  let floorsNum: String
  let floorsCnt: String
  let priceAr: String
  let photos: [ObjectPhotos]
  let viewsCount: String
  let isFavorite: String
  
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
              photos: [ObjectPhotos],
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
    self.photos = photos
    self.viewsCount = viewsCount
    self.isFavorite = isFavorite
  }
}

extension ObjectViewModel: ListDiffable {
  public func diffIdentifier() -> NSObjectProtocol {
    id as NSObjectProtocol
  }
  
  public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    guard self !== object else { return true }
    guard let object = object as? ObjectViewModel else { return false }
    return id == object.id
  }
}

extension ObjectViewModel: Equatable {
  public static func == (lhs: ObjectViewModel, rhs: ObjectViewModel) -> Bool {
    lhs.id == rhs.id
  }
}
