//
//  LocationSectionController.swift
//  AppLibrary
//
//  Created by nedstar on 26.05.2020.
//

import IGListKit
import EsoftUIKit

public protocol LocationSectionControllerOutput: AnyObject {
  func didTap(in cell: LocationCellInput)
}

public final class LocationSectionController: ListSectionController {
  private var object: LocationViewModel?
  
  weak var output: LocationSectionControllerOutput?
  
  public convenience init(output: LocationSectionControllerOutput?, inset: UIEdgeInsets? = nil) {
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
    guard let context = collectionContext else { return CGSize() }
    
    let width: CGFloat = context.containerSize.width
    
    return CGSize(width: width, height: 48)
  }
  
  override public func cellForItem(at index: Int) -> UICollectionViewCell {
    guard  let object = object,
      let cell = collectionContext?.dequeueReusableCell(of: LocationCell.self,
                                                        for: self,
                                                        at: index) as? LocationCell else {
                                                          return UICollectionViewCell()
    }
    cell.output = self
    cell.bindViewModel(object)
    return cell
  }
  
  override public func didUpdate(to object: Any) {
    self.object = object as? LocationViewModel
  }
}

extension LocationSectionController: LocationCellOutput {
  public func didTap(in cell: LocationCellInput) {
    output?.didTap(in: cell)
  }
}
