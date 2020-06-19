//
//  SpecialistDetailsActionSectionController.swift
//  SpecialistsUI
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import IGListKit
import EsoftUIKit

public protocol SpecialistDetailsActionSectionControllerOutput: class {
  func didTapAction(in cell: SpecialistDetailsActionCellInput)
}

public final class SpecialistDetailsActionSectionController: ListSectionController {
  private var object: SpecialistDetailsActionViewModel?
  weak var output: SpecialistDetailsActionSectionControllerOutput?
  
  public convenience init(output: SpecialistDetailsActionSectionControllerOutput?) {
    self.init()
    self.output = output
  }
  
  override public init() {
    super.init()
    inset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
  }
  
  override public func sizeForItem(at index: Int) -> CGSize {
    guard let context = collectionContext else { return CGSize() }
    
    let width: CGFloat = context.containerSize.width
    
    return CGSize(width: width, height: Space.large)
  }
  
  override public func cellForItem(at index: Int) -> UICollectionViewCell {
    guard  let object = object,
      let cell = collectionContext?.dequeueReusableCell(of: SpecialistDetailsActionCell.self,
                                                        for: self,
                                                        at: index) as? SpecialistDetailsActionCell else {
                                                          return UICollectionViewCell()
    }
    
    cell.output = self
    cell.bindViewModel(object)
    return cell
  }
  
  override public func didUpdate(to object: Any) {
    self.object = object as? SpecialistDetailsActionViewModel
  }
}

extension SpecialistDetailsActionSectionController: SpecialistDetailsActionCellOutput {
  public func didTapAction(in cell: SpecialistDetailsActionCellInput) {
    output?.didTapAction(in: cell)
  }
}
