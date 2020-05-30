//
//  ObjectsSectionController.swift
//  AppLibrary
//
//  Created by Алексей Макаров on 08.05.2020.
//

import Foundation
import IGListKit
import EsoftUIKit

public final class ObjectsSectionController: ListSectionController {
  private var object: ObjectsViewModel?
  
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
    self.object = object as? ObjectsViewModel
  }
  
  override public func sizeForItem(at index: Int) -> CGSize {
    guard let context = collectionContext else { return CGSize() }
    
    let width: CGFloat = context.containerSize.width
    
    let addressFont = UIFont.systemFont(ofSize: 13)
    let city = object!.city
    let district = object!.district
    let street = object!.street
    let house = object!.house
    let address = "\(city), \(district), \(street), \(house)"
    
    let addressHeight = CGFloat(address.height(width: width - 32, font: addressFont))
    
    print(addressHeight)
    
    var height: CGFloat = 0
    if addressHeight > 30 {
      height += 2
    }
    
    let calculateheight = 327 + addressHeight + height
    
    print("calculateheight : ", calculateheight)
    
    return CGSize(width: width, height: calculateheight) // 343
  }
  
}
