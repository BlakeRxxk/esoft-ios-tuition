//
//  AuthCitySectionController.swift
//  AppLibrary
//
//  Created by nedstar on 25.05.2020.
//

import IGListKit
import EsoftUIKit

public protocol AuthCitiesSectionControllerOutput: AnyObject {
  func didTap(in cell: AuthCityCellInput)
}

public final class AuthCitiesSectionController: ListSectionController {
  private var object: AuthCityViewModel?
  
  weak var output: AuthCitiesSectionControllerOutput?
  
  public convenience init(output: AuthCitiesSectionControllerOutput?, inset: UIEdgeInsets? = nil) {
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
    
    var height = 48
    if !self.isLastSection {
      height = height + 1
    }
    if !object.isComingSoon && object.regions.count > 0 {
      height = height + 16 // как увеличчить на 16 ещё раз?
    }
    
    return CGSize(width: width, height: CGFloat(height))
  }
  
  override public func cellForItem(at index: Int) -> UICollectionViewCell {
    guard  let object = object,
      let cell = collectionContext?.dequeueReusableCell(of: AuthCityCell.self,
                                                        for: self,
                                                        at: index) as? AuthCityCell else {
                                                          return UICollectionViewCell()
    }
    cell.output = self
    cell.lastCell = self.isLastSection
    cell.bindViewModel(object)
    return cell
  }
  
  override public func didUpdate(to object: Any) {
    self.object = object as? AuthCityViewModel
  }
  
  public func regionsLabelHeight(with width: CGFloat) -> CGFloat {
    let label: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
    label.lineBreakMode = NSLineBreakMode.byWordWrapping
//    label.setStyles(
//      UILabel.Styles.small,
//      UILabel.Styles.alignLeft,
//      UILabel.Styles.multiline,
//      UILabel.ColorStyle.primary
//    )
//    label.text = self
//
//    label.sizeToFit()
    return round(label.frame.height)
  }

}

extension AuthCitiesSectionController: AuthCityCellOutput {
  public func didTap(in cell: AuthCityCellInput) {
    output?.didTap(in: cell)
  }
}
