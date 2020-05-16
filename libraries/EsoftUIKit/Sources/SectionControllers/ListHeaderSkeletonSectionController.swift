//
//  ListHeaderSkeletonSectionController.swift
//  ESUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import IGListKit

public final class ListHeaderSkeletonSectionController: ListSectionController {
  private var object: ListHeaderSkeletonViewModel?

  override public func sizeForItem(at index: Int) -> CGSize {
    guard let context = collectionContext else { return CGSize() }
    
    let width: CGFloat = context.containerSize.width
    
    return CGSize(width: width, height: 48)
  }
  
  override public func cellForItem(at index: Int) -> UICollectionViewCell {
    guard let cell = collectionContext?.dequeueReusableCell(of: ListHeaderSkeletonCell.self, for: self, at: index) as? ListHeaderSkeletonCell else {
      return UICollectionViewCell()
    }

    return cell
  }
  
  override public func didUpdate(to object: Any) {
    self.object = object as? ListHeaderSkeletonViewModel
  }
}
