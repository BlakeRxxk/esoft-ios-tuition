//
//  CitiesSectionController.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import UIKit
import IGListKit

public final class CitiesSectionController: ListSectionController {
  private var object: CityViewModel?
  
  override public func sizeForItem(at index: Int) -> CGSize {
    guard let context = collectionContext else { return CGSize() }
    
    let width: CGFloat = context.containerSize.width
    
    return CGSize(width: width, height: 48)
  }
  
  override public func cellForItem(at index: Int) -> UICollectionViewCell {
    guard  let object = object,
      let cell = collectionContext?.dequeueReusableCell(of: CityCell.self,
                                                        for: self,
                                                        at: index) as? CityCell else {
                                                          return UICollectionViewCell()
    }
  
    cell.bindViewModel(object)
    return cell
  }
  
  override public func didUpdate(to object: Any) {
    self.object = object as? CityViewModel
  }
}
