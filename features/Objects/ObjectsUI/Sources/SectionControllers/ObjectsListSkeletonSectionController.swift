//
//  ObjectsListSkeletonSectionController.swift
//  ObjectsUI#iphonesimulator-x86_64
//
//  Created by Алексей Макаров on 28.05.2020.
//

import IGListKit
import EsoftUIKit

public final class ObjectsListSkeletonSectionController: ListSectionController {
  private var object: ListSkeletonViewModel?
  
  public convenience init(inset: UIEdgeInsets? = nil) {
    self.init()
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
    
    return CGSize(width: width, height: 331)
  }
  
  override public func cellForItem(at index: Int) -> UICollectionViewCell {
    guard let cell = collectionContext?.dequeueReusableCell(of: ObjectsSkeletonCell.self, for: self, at: index) as? ObjectsSkeletonCell else {
      return UICollectionViewCell()
    }

    return cell
  }

}
