//
//  SellerTicketSectionController.swift
//  AppLibrary
//
//  Created by wtildestar on 23/05/2020.
//

import IGListKit
import EsoftUIKit

public protocol SellerTicketSectionControllerOutput: SellerTicketCellOutput {}

public final class SellerTicketSectionController: ListSectionController {
  private var object: SellerTicketViewModel?
  weak var output: SellerTicketSectionControllerOutput?
  
  public convenience init(output: SellerTicketSectionControllerOutput?, inset: UIEdgeInsets? = nil) {
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
    
    return CGSize(width: width, height: 700)
  }
  
  override public func cellForItem(at index: Int) -> UICollectionViewCell {
    guard  let object = object,
      let cell = collectionContext?.dequeueReusableCell(of: SellerTicketCell.self,
                                                        for: self,
                                                        at: index) as? SellerTicketCell else {
                                                          return UICollectionViewCell()
    }
    cell.output = self
    cell.bindViewModel(object)
    return cell
  }
  
  override public func didUpdate(to object: Any) {
    self.object = object as? SellerTicketViewModel
  }
}

extension SellerTicketSectionController: SellerTicketCellOutput {
  public func didTapEditDescription(in cell: SellerTicketCellInput) {
    print("didTapEditDescription in SellerTicketSectionController")
    output?.didTapEditDescription(in: cell)
  }
  
  public func didTapEditSellerPrice(in cell: SellerTicketCellInput) {
    print("didTapEditSellerPrice in SellerTicketSectionController")
    output?.didTapEditSellerPrice(in: cell)
  }
}
