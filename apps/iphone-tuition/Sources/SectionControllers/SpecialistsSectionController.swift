//
//  SpecialistsSectionController.swift
//  ESUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import IGListKit

public protocol SpecialistsSectionControllerOutput: class {
  func didTapSpecialist(in cell: SpecialistCellInput)
  func didTapPhone(in cell: SpecialistCellInput)
  func didTapChat(in cell: SpecialistCellInput)
}

public final class SpecialistsSectionController: ListSectionController {
  private var object: SpecialistViewModel?
  weak var output: SpecialistsSectionControllerOutput?
  
  public convenience init(output: SpecialistsSectionControllerOutput?, inset: UIEdgeInsets? = nil) {
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
      let cell = collectionContext?.dequeueReusableCell(of: SpecialistCell.self,
                                                        for: self,
                                                        at: index) as? SpecialistCell else {
                                                          return UICollectionViewCell()
    }
    cell.output = self
    cell.bindViewModel(model: object)
    return cell
  }
  
  override public func didUpdate(to object: Any) {
    self.object = object as? SpecialistViewModel
  }
}

extension SpecialistsSectionController: SpecialistCellOutput {
  public func didTapChat(in cell: SpecialistCellInput) {
    output?.didTapChat(in: cell)
  }
  
  public func didTapPhone(in cell: SpecialistCellInput) {
    output?.didTapPhone(in: cell)
  }
  
  public func didTapSpecialist(in cell: SpecialistCellInput) {
    output?.didTapSpecialist(in: cell)
  }
}
