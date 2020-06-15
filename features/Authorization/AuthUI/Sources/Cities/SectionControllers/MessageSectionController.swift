//
//  MessageSectionController.swift
//  Authorization#iphonesimulator-x86_64
//
//  Created by nedstar on 27.05.2020.
//

import IGListKit
import EsoftUIKit

public final class MessageSectionController: ListSectionController {
  private var object: MessageViewModel?
  
  override public init() {
    super.init()
    inset = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
  }
  
  override public func sizeForItem(at index: Int) -> CGSize {
    guard let context = collectionContext else { return CGSize() }
    
    guard let text = object?.message else { return CGSize() }
    
    let width: CGFloat = context.containerSize.width
    
    let height = text.styledLabelHeight(with: width - 32,
                                        UILabel.Styles.tiny,
                                        UILabel.ColorStyle.placeholders,
                                        UILabel.Styles.alignCenter,
                                        UILabel.Styles.multiline)
    
    return CGSize(width: width, height: height)
  }
  
  override public func cellForItem(at index: Int) -> UICollectionViewCell {
    guard  let object = object,
      let cell = collectionContext?.dequeueReusableCell(of: MessageCell.self,
                                                        for: self,
                                                        at: index) as? MessageCell else {
                                                          return UICollectionViewCell()
    }
    cell.bindViewModel(object)
    return cell
  }
  
  override public func didUpdate(to object: Any) {
    self.object = object as? MessageViewModel
  }
}
