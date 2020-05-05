//
//  DistrictsSectionController.swift
//  AppLibrary
//
//  Created by Blake Rxxk on 29.04.2020.
//

import UIKit
import IGListKit

public final class DistrictsSectionController: ListSectionController {
  private var object: DistrictsViewModel?
  
  override public func sizeForItem(at index: Int) -> CGSize {
    guard let context = collectionContext else { return CGSize() }
    
    let width: CGFloat = context.containerSize.width
    
    return CGSize(width: width, height: 48)
  }
  
  override public func cellForItem(at index: Int) -> UICollectionViewCell {
    guard let object = object,
      let cell = collectionContext?.dequeueReusableCell(of: DistrictCell.self,
                                                        for: self,
                                                        at: index) as? DistrictCell else {
                                                          return UICollectionViewCell()
    }
  
    cell.bindViewModel(object)
    return cell
  }
  
  override public func didUpdate(to object: Any) {
    self.object = object as? DistrictsViewModel
  }
}
