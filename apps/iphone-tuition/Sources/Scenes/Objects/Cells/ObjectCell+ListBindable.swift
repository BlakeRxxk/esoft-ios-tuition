//
//  ObjectCell+ListBindable.swift
//  AppLibrary
//
//  Created by Алексей Макаров on 08.05.2020.
//

import Foundation
import IGListKit


extension ObjectCell: ListBindable {
  public func bindViewModel(_ viewModel: Any) {
    guard let viewModel = viewModel as? ObjectViewModel else { return }
    
    // previewItem
    
    let price = viewModel.price
    let oldPrice = viewModel.oldPrice
    let city = viewModel.city
    let district = viewModel.district
    let street = viewModel.street
    let house = viewModel.house
    
    previewItemViewYOGA.currentPrice = price
    previewItemViewYOGA.price = oldPrice
    previewItemViewYOGA.address = "\(city), \(district), \(street), \(house)"
    
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
    
    addressItemViewYOGA.title = "\(type), \(roomsCount), \(areaFlat), \(floorsNum), \(priceAr)"
    
    let dataImg = viewModel.photos.map { $0.fileName }
    previewItemViewYOGA.dataSet = dataImg

    print(dataImg)
    
    layoutSubviews()
  }
}
