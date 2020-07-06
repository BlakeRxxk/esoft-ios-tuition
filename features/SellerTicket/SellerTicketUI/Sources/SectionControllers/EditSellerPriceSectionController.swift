//
//  EditSellerPriceSectionController.swift
//  SellerTicketUI#iphonesimulator-x86_64
//
//  Created by wtildestar on 17/06/2020.
//

import IGListKit
import EsoftUIKit

public protocol EditSellerPriceSectionControllerOutput: AnyObject {}

public final class EditSellerPriceSectionController: ListSectionController {
  private var object: EditSellerPriceViewModel?
  weak var output: EditSellerPriceSectionControllerOutput?
  
  public convenience init(output: EditSellerPriceSectionControllerOutput?, inset: UIEdgeInsets? = nil) {
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
    
    return CGSize(width: width, height: 500)
  }
  
  override public func cellForItem(at index: Int) -> UICollectionViewCell {
    guard  let object = object,
      let cell = collectionContext?.dequeueReusableCell(of: EditSellerPriceCell.self,
                                                        for: self,
                                                        at: index) as? EditSellerPriceCell else {
                                                          return UICollectionViewCell()
    }
    cell.output = self
    cell.bindViewModel(object)
    return cell
  }
  
  override public func didUpdate(to object: Any) {
    self.object = object as? EditSellerPriceViewModel
  }
}

extension EditSellerPriceSectionController: EditSellerPriceCellOutput {
  public func didTapInfoButton(in cell: EditSellerPriceCellInput) {
    print("didTapInfoButton in EditSellerPriceSectionController")
    
  }
}
