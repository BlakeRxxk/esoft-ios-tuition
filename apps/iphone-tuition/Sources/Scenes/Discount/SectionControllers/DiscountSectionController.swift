//
//  DiscountSectionController.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import UIKit
import IGListKit

public final class DiscountSectionController: ListSectionController {
  private var object: DiscountViewModel?
  private var pressBackOnNavbar: (UIButton?) -> Void

  public init(pressBackOnNavbar: @escaping (UIButton?) -> Void) {
    self.pressBackOnNavbar = pressBackOnNavbar
    super.init()
  }

  override public func sizeForItem(at index: Int) -> CGSize {
    guard let context = collectionContext else { return CGSize() }

    let width: CGFloat = context.containerSize.width

    return CGSize(width: width, height: 600)
  }

  override public func cellForItem(at index: Int) -> UICollectionViewCell {
    guard  let object = object,
      let cell = collectionContext?.dequeueReusableCell(of: DiscountCell.self,
                                                        for: self,
                                                        at: index) as? DiscountCell else {
                                                          return UICollectionViewCell()
    }

    cell.bindViewModel(object, pressBackOnNavbar: pressBackOnNavbar)
    return cell
  }

  override public func didUpdate(to object: Any) {
    self.object = object as? DiscountViewModel
  }
}
