//
//  SellerTicketListSkeletonSectionController.swift
//  AppLibrary
//
//  Created by wtildestar on 23/05/2020.
//

import IGListKit
import EsoftUIKit

public final class SellerTicketListSkeletonSectionController: ListSectionController {
  private var object: ListSkeletonViewModel?
  
  public convenience init(inset: UIEdgeInsets? = nil) {
    self.init()
    if let inset = inset {
      self.inset = inset
    }
  }
  
  override public init() {
    super.init()
    inset = UIEdgeInsets(top: 0, left: 0, bottom: 8, right: 0)
  }
  
  override public func sizeForItem(at index: Int) -> CGSize {
    guard let context = collectionContext else { return CGSize() }
    
    let width: CGFloat = context.containerSize.width
    
    return CGSize(width: width, height: 330)
  }
  
  override public func cellForItem(at index: Int) -> UICollectionViewCell {
    guard let cell = collectionContext?.dequeueReusableCell(of: SellerTicketSkeletonCell.self, for: self, at: index) as? SellerTicketSkeletonCell else {
      return UICollectionViewCell()
    }
    
    return cell
  }
  
  override public func didUpdate(to object: Any) {
    self.object = object as? ListSkeletonViewModel
  }
}
