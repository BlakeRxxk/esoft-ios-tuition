//
//  RootViewItemSectionController.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import UIKit
import IGListKit

public final class RootViewItemSectionController: ListSectionController {
  private var object: RootViewItemViewModel?
  
  public weak var output: RootViewItemSectionOutput?
  
  public convenience init(output: RootViewItemSectionOutput?) {
    self.init()
    self.output = output
  }
  
  override public func sizeForItem(at index: Int) -> CGSize {
    guard let context = collectionContext else { return CGSize() }
    
    let width: CGFloat = context.containerSize.width
    
    return CGSize(width: width, height: 48)
  }
  
  override public func cellForItem(at index: Int) -> UICollectionViewCell {
    guard  let object = object,
      let cell = collectionContext?.dequeueReusableCell(of: RootViewItemCell.self,
                                                        for: self,
                                                        at: index) as? RootViewItemCell else {
                                                          return UICollectionViewCell()
    }
    
    cell.bindViewModel(object)
    cell.output = self
    return cell
  }
  
  override public func didUpdate(to object: Any) {
    self.object = object as? RootViewItemViewModel
  }
}

extension RootViewItemSectionController: RootViewItemOutput {
  public func didTapRow(in cell: RootViewItemInput) {
    output?.didTapAction(in: cell)
  }
}
