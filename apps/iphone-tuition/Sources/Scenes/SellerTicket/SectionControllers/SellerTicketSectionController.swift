//
//  SellerTicketSectionController.swift
//  AppLibrary
//
//  Created by wtildestar on 08/05/2020.
//

import UIKit
import IGListKit

public final class SellerTicketSectionController: ListSectionController {
  private var object: SellerTicketViewModel?
  
  override public func sizeForItem(at index: Int) -> CGSize {
    guard let context = collectionContext else { return CGSize() }
    
    let width: CGFloat = context.containerSize.width
    
    return CGSize(width: width, height: 400)
  }
  
  override public func cellForItem(at index: Int) -> UICollectionViewCell {
    guard  let object = object,
      let cell = collectionContext?.dequeueReusableCell(of: SellerTicketCell.self,
                                                        for: self,
                                                        at: index) as? SellerTicketCell else {
                                                          return UICollectionViewCell()
    }
    
    cell.bindViewModel(object)
    return cell
  }
  
  override public func didUpdate(to object: Any) {
    self.object = object as? SellerTicketViewModel
  }
}
