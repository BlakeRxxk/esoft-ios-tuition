//
//  ListHeaderSectionController.swift
//  ESUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import IGListKit
import EsoftUIKit

public protocol ListHeaderSectionControllerOutput: class {
  func didTapAction(in cell: ListHeaderCellInput)
}

public final class ListHeaderSectionController: ListSectionController {
  private var object: ListHeaderViewModel?
  weak var output: ListHeaderSectionControllerOutput?
  
  public convenience init(output: ListHeaderSectionControllerOutput?) {
    self.init()
    self.output = output
  }
  
  override public func sizeForItem(at index: Int) -> CGSize {
    guard let context = collectionContext else { return CGSize() }

    let width: CGFloat = context.containerSize.width

    return CGSize(width: width, height: Space.large)
  }
  
  override public func cellForItem(at index: Int) -> UICollectionViewCell {
    guard let object = object,
      let cell = collectionContext?.dequeueReusableCell(of: ListHeaderCell.self,
                                                        for: self,
                                                        at: index) as? ListHeaderCell else {
      return UICollectionViewCell()
    }

    cell.bindViewModel(object)
    cell.output = self
    return cell
  }
  
  override public func didUpdate(to object: Any) {
    self.object = object as? ListHeaderViewModel
  }
}

extension ListHeaderSectionController: ListHeaderCellOutput {
  public func didTapAction(in cell: ListHeaderCellInput) {
    output?.didTapAction(in: cell)
  }
}
