//
//  UnauthorizedListSectionController.swift
//  ESUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import IGListKit

public protocol UnauthorizedListSectionControllerOutput: class {
  func didTapActionButton(in cell: UnauthorizedListCellInput)
}

public final class UnauthorizedListSectionController: ListSectionController {
  private var object: UnauthorizedListViewModel?
  weak var output: UnauthorizedListSectionControllerOutput?
  
  public convenience init(output: UnauthorizedListSectionControllerOutput?) {
    self.init()
    self.output = output
  }

  override public func sizeForItem(at index: Int) -> CGSize {
    guard let context = collectionContext, let object = object else { return CGSize() }
    
    let width: CGFloat = context.containerSize.width
    var height: CGFloat = context.containerSize.height
    
    if object.displayedWithTitle {
      height -= Space.large
    }
    
    return CGSize(width: width, height: height)
  }
  
  override public func cellForItem(at index: Int) -> UICollectionViewCell {
    guard let cell = collectionContext?.dequeueReusableCell(of: UnauthorizedListCell.self,
                                                            for: self,
                                                            at: index) as? UnauthorizedListCell,
      let object = object else {
      return UICollectionViewCell()
    }
    cell.bindViewModel(object)
    cell.output = self
    return cell
  }
  
  override public func didUpdate(to object: Any) {
    self.object = object as? UnauthorizedListViewModel
  }
}

extension UnauthorizedListSectionController: UnauthorizedListCellOutput {
  public func didTapActionButton(in cell: UnauthorizedListCellInput) {
    output?.didTapActionButton(in: cell)
  }
}
