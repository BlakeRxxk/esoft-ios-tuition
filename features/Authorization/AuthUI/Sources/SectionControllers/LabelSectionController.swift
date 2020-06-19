//
//  LabelSectionController.swift
//  AuthUI#iphonesimulator-x86_64
//
//  Created by nedstar on 19.06.2020.
//

import IGListKit
import EsoftUIKit

public final class LabelSectionController: ListSectionController {
  private var object: LabelViewModel?
  
  override public init() {
    super.init()
    
    inset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
  }
  
  override public func sizeForItem(at index: Int) -> CGSize {
    guard let object = object,
      let context = collectionContext else { return CGSize() }
    
    let width: CGFloat = context.containerSize.width
    
    let height: CGFloat = object.text.styledLabelHeight(with: width, object.builder)
    
    return CGSize(width: width, height: height)
  }
  
  override public func cellForItem(at index: Int) -> UICollectionViewCell {
    guard  let object = object,
      let cell = collectionContext?.dequeueReusableCell(of: LabelCell.self,
                                                        for: self,
                                                        at: index) as? LabelCell else {
                                                          return UICollectionViewCell()
    }
    inset = UIEdgeInsets(top: object.padding.top, left: object.padding.left, bottom: object.padding.bottom, right: object.padding.right)
    cell.bindViewModel(object)
    return cell
  }
  
  override public func didUpdate(to object: Any) {
    self.object = object as? LabelViewModel
    guard let viewModel = self.object else { return }
    inset = UIEdgeInsets(top: viewModel.padding.top, left: viewModel.padding.left, bottom: viewModel.padding.bottom, right: viewModel.padding.right)
  }
}
