//
//  EmptyListSectionController.swift
//  ESUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import IGListKit

public final class EmptyListSectionController: ListSectionController {
  private var object: EmptyListViewModel?

  override public func sizeForItem(at index: Int) -> CGSize {
    guard let context = collectionContext, let object = object else { return CGSize() }
    
    let width: CGFloat = context.containerSize.width
    var height: CGFloat = context.containerSize.height
    
    if object.displayedWithTitle {
      height -= Space.large
    }
    
    if object.keyboardHeight != nil {
      height -= object.keyboardHeight ?? 0
    }
    
    return CGSize(width: width, height: height)
  }
  
  override public func cellForItem(at index: Int) -> UICollectionViewCell {
    guard let cell = collectionContext?.dequeueReusableCell(of: EmptyListCell.self,
                                                            for: self,
                                                            at: index) as? EmptyListCell,
      let object = object else {
      return UICollectionViewCell()
    }
    cell.bindViewModel(object)

    return cell
  }
  
  override public func didUpdate(to object: Any) {
    self.object = object as? EmptyListViewModel
  }
}
