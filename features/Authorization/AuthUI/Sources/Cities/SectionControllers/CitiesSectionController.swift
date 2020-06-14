//
//  CitiesSectionController.swift
//  orization#iphonesimulator-x86_64
//
//  Created by nedstar on 26.05.2020.
//

import IGListKit
import EsoftUIKit

public protocol CitiesSectionControllerOutput: AnyObject {
  func didTap(in cell: CityCellInput)
}

public final class CitiesSectionController: ListSectionController {
  private var object: CityViewModel?
  
  weak var output: CitiesSectionControllerOutput?
  
  public convenience init(output: CitiesSectionControllerOutput?, inset: UIEdgeInsets? = nil) {
    self.init()
    self.output = output
    if let inset = inset {
      self.inset = inset
    }
  }
  
  override public init() {
    super.init()
    inset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
  }
  
  override public func sizeForItem(at index: Int) -> CGSize {
    guard
      let context = collectionContext,
      let object = object
      else { return CGSize() }
    
    let width: CGFloat = context.containerSize.width
    
    var height: CGFloat = 48
    if !self.isLastSection {
      height += 1
    }
    if !object.isComingSoon, let text = object.regionsToString() {
      height += text.styledLabelHeight(with: width - 32, UILabel.Styles.tiny, UILabel.Styles.doubleLine)
    }
    
    return CGSize(width: width, height: CGFloat(height))
  }
  
  override public func cellForItem(at index: Int) -> UICollectionViewCell {
    guard  let object = object,
      let cell = collectionContext?.dequeueReusableCell(of: CityCell.self,
                                                        for: self,
                                                        at: index) as? CityCell else {
                                                          return UICollectionViewCell()
    }
    cell.output = self
    cell.lastCell = self.isLastSection
    cell.bindViewModel(object)
    return cell
  }
  
  override public func didUpdate(to object: Any) {
    self.object = object as? CityViewModel
  }
}

extension CitiesSectionController: CityCellOutput {
  public func didTap(in cell: CityCellInput) {
    output?.didTap(in: cell)
  }
}
