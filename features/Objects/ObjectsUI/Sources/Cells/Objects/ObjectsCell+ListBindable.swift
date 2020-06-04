//
//  ObjectsCell+ListBindable.swift
//  ObjectsUI#iphonesimulator-x86_64
//
//  Created by Алексей Макаров on 28.05.2020.
//

import Foundation
import EsoftUIKit
import IGListKit.IGListBindable

extension ObjectsCell: ListBindable {
  public func bindViewModel(_ viewModel: Any) {
    guard let viewModel = viewModel as? ObjectsViewModel else { return }
    
    let price = viewModel.price
    let viewmodelOldPrice = viewModel.oldPrice
    let city = viewModel.city
    let district = viewModel.district
    let street = viewModel.street
    let house = viewModel.house
    
    currentPrice = "\(price) руб."
    oldPrice = viewmodelOldPrice
    address = "\(city), \(district), \(street), \(house)"
    
    // addressItem
     func typeFlat(_ type: String) -> String {
       switch type {
       case "flat":
         return "Квартира"
       case "pansion":
         return "Пансионат"
       default:
         return ""
       }
     }
    
    let type = typeFlat(viewModel.type)
    let roomsCount = "\(viewModel.roomsCount)-комн."
    let areaFlat = "\(Int(Float(viewModel.areaFlat)!)) м²"
    let floorsNum = "этаж \(viewModel.floorsNum)/\(viewModel.floorsCnt)"
    let priceAr = "\(viewModel.priceAr) руб./м²"
    
    objectsDescription = "\(type), \(roomsCount), \(areaFlat), \(floorsNum), \(priceAr)"
    
    views = viewModel.viewsCount
    favorites = viewModel.isFavorite
    code = viewModel.id
    
    photos = viewModel.photos
    
    layoutSubviews()
  }
}
