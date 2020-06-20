//
//  DiscountSectionController.swift
//  LoyaltyUI
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import IGListKit
import EsoftUIKit
import LoyaltyCore

public protocol DiscountSectionControllerOutput: class {
  func pressBackOnNavbar(in cell: DiscountCellInput)
}

public final class DiscountSectionController: ListSectionController {
  private var object: DiscountViewModel?
  weak var output: DiscountSectionControllerOutput?
  
  public convenience init(output: DiscountSectionControllerOutput?, inset: UIEdgeInsets? = nil) {
    self.init()
    self.output = output
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
    
    return CGSize(width: width, height: 80 + (48 * 2))
  }
  
  override public func cellForItem(at index: Int) -> UICollectionViewCell {
    guard  let object = object,
      let cell = collectionContext?.dequeueReusableCell(of: DiscountCell.self,
                                                        for: self,
                                                        at: index) as? DiscountCell else {
                                                          return UICollectionViewCell()
    }
    cell.output = self
    cell.bindViewModel(object)
    return cell
  }
  
  override public func didUpdate(to object: Any) {
    self.object = object as? DiscountViewModel
  }
}

extension DiscountSectionController: DiscountCellOutput {
  public func pressBackOnNavbar(in cell: DiscountCellInput) {
    output?.pressBackOnNavbar(in: cell)
  }
}
