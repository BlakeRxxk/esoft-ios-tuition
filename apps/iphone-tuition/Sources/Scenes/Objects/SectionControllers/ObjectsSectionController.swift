//
//  ObjectsSectionController.swift
//  AppLibrary
//
//  Created by Алексей Макаров on 08.05.2020.
//

import Foundation
import IGListKit

public final class ObjectsSectionController: ListSectionController {
  private var object: ObjectViewModel?
  
  override public func sizeForItem(at index: Int) -> CGSize {
    guard let context = collectionContext else { return CGSize() }
    
    let width: CGFloat = context.containerSize.width
    
    let addressFont = UIFont.systemFont(ofSize: 15)
    let address = "\(object!.city), \(object!.district), \(object!.street), \(object!.house) test test test"
    print(address)
    
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
    let type = typeFlat(object!.type)
    let roomsCount = "\(object!.roomsCount)-комн."
    let areaFlat = "\(Int(Float(object!.areaFlat)!)) м²"
    let floorsNum = "этаж \(object!.floorsNum)/\(object!.floorsCnt)"
    let priceAr = "\(object!.priceAr) руб./м²"
    
    let title = "\(type), \(roomsCount), \(areaFlat), \(floorsNum), \(priceAr)"
    print(title)
    
    let calculateheight = 293 + (address.height(width: width , font: addressFont)) + (title.height(width: width - 60, font: addressFont))
    print(title.height(width: width - 70, font: addressFont))
    print("calculateheight : ", calculateheight)
//    print("calculateheight ", calculateheight)
    
    return CGSize(width: width, height: calculateheight) // 343
  }
  
  override init() {
    super.init()
    inset = UIEdgeInsets(top: 0, left: 0, bottom: 8, right: 0)
  }
  
  override public func cellForItem(at index: Int) -> UICollectionViewCell {
    guard  let object = object,
      let cell = collectionContext?.dequeueReusableCell(of: ObjectCell.self,
                                                        for: self,
                                                        at: index) as? ObjectCell else {
                                                          return UICollectionViewCell()
    }
   
    cell.bindViewModel(object)
    return cell
  }
  
  override public func didUpdate(to object: Any) {
    self.object = object as? ObjectViewModel
  }
}
