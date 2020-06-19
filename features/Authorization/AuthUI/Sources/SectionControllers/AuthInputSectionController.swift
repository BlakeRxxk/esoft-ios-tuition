//
//  AuthInputSectionController.swift
//  AuthUI#iphonesimulator-x86_64
//
//  Created by nedstar on 19.06.2020.
//

import IGListKit
import EsoftUIKit

public protocol AuthInputSectionControllerOutput: AuthInputCellOutput {}

public final class AuthInputSectionController: ListSectionController {
  private var object: AuthInputViewModel?
  
  weak var output: AuthInputSectionControllerOutput?
  
  public convenience init(_ output: AuthInputSectionControllerOutput? = nil,
                          inset: UIEdgeInsets? = nil
  ) {
    self.init()
    
    if let inset = inset {
      self.inset = inset
    }
    
    self.output = output
  }
  
  override public init() {
    super.init()
    inset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
  }
  
  override public func sizeForItem(at index: Int) -> CGSize {
    guard let context = collectionContext else { return CGSize() }
    
    let width: CGFloat = context.containerSize.width
    
    return CGSize(width: width, height: 64)
  }
  
  override public func cellForItem(at index: Int) -> UICollectionViewCell {
    guard  let object = object,
      let cell = collectionContext?.dequeueReusableCell(of: AuthInputCell.self,
                                                        for: self,
                                                        at: index) as? AuthInputCell else {
                                                          return UICollectionViewCell()
    }
    cell.bindViewModel(object)
    cell.output = self
    return cell
  }
  
  override public func didUpdate(to object: Any) {
    self.object = object as? AuthInputViewModel
  }
}

extension AuthInputSectionController: AuthInputCellOutput {
  public func textDidChange(newVal: String) {
    output?.textDidChange(newVal: newVal)
  }
}
