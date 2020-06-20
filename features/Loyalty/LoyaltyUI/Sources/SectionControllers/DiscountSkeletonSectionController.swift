//
//  DiscounSkeletonSectionController.swift
//  LoyaltyUI
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import IGListKit
import EsoftUIKit

//public final class DiscountSkeletonSectionController: ListSectionController {
//  private var object: DiscountSkeletonViewModel?
//  
//  public convenience init(inset: UIEdgeInsets? = nil) {
//    self.init()
//    if let inset = inset {
//      self.inset = inset
//    }
//  }
//  
//  override public init() {
//    super.init()
//    inset = UIEdgeInsets(top: 0, left: 0, bottom: 8, right: 0)
//  }
//  
//  override public func sizeForItem(at index: Int) -> CGSize {
//    guard let context = collectionContext else { return CGSize() }
//    
//    let width: CGFloat = context.containerSize.width
//    
//    return CGSize(width: width, height: 176)
//  }
//  
//  override public func cellForItem(at index: Int) -> UICollectionViewCell {
//    guard let cell = collectionContext?.dequeueReusableCell(of: DiscountSkeletonCell.self, for: self, at: index) as? DiscountSkeletonCell else {
//      return UICollectionViewCell()
//    }
//
//    return cell
//  }
//  
//  override public func didUpdate(to object: Any) {
//    self.object = object as? DiscountSkeletonViewModel
//  }
//}
