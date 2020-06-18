//
//  SpecialistsDetailsSectionController.swift
//  SpecialistsUI
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import IGListKit
import EsoftUIKit

public protocol SpecialistsDetailsSectionControllerOutput: class {
  func didTapPhone(in cell: SpecialistDetailsCellInput)
  func didTapEmail(in cell: SpecialistDetailsCellInput)
}

public final class SpecialistsDetailsSectionController: ListSectionController {
  private var object: SpecialistViewModel?
  weak var output: SpecialistsDetailsSectionControllerOutput?
  
  public convenience init(output: SpecialistsDetailsSectionControllerOutput?) {
    self.init()
    self.output = output
  }
  
  override public init() {
    super.init()
    inset = UIEdgeInsets(top: Space.tiny, left: 0, bottom: Space.tiny, right: 0)
  }
  
  override public func sizeForItem(at index: Int) -> CGSize {
    guard let context = collectionContext else { return CGSize() }
    
    let width: CGFloat = context.containerSize.width
    
    return CGSize(width: width, height: 80 + (Space.large * 2))
  }
  
  override public func cellForItem(at index: Int) -> UICollectionViewCell {
    guard  let object = object,
      let cell = collectionContext?.dequeueReusableCell(of: SpecialistDetailsCell.self,
                                                        for: self,
                                                        at: index) as? SpecialistDetailsCell else {
                                                          return UICollectionViewCell()
    }
    cell.output = self
    cell.bindViewModel(object)
    return cell
  }
  
  override public func didUpdate(to object: Any) {
    self.object = object as? SpecialistViewModel
  }
}

extension SpecialistsDetailsSectionController: SpecialistDetailsCellOutput {
  public func didTapEmail(in cell: SpecialistDetailsCellInput) {
    output?.didTapEmail(in: cell)
  }
  
  public func didTapPhone(in cell: SpecialistDetailsCellInput) {
    output?.didTapPhone(in: cell)
  }
}
