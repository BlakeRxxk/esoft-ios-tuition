//
//  PasswordSectionController.swift
//  AuthUI#iphonesimulator-x86_64
//
//  Created by nedstar on 18.06.2020.
//

import IGListKit
import EsoftUIKit

public protocol PasswordSectionControllerOutput: PasswordCellOutput {}

public final class PasswordSectionController: ListSectionController {
  private var object: PasswordViewModel?
  
  weak var output: PasswordSectionControllerOutput?
  
  public init(_ output: PasswordSectionControllerOutput? = nil) {
    super.init()
    
    self.output = output
  }
  
  override public func sizeForItem(at index: Int) -> CGSize {
    guard let context = collectionContext else { return CGSize() }
    
    let width: CGFloat = context.containerSize.width
    
    var height: CGFloat = 325
    
    return CGSize(width: width, height: height)
  }
  
  override public func cellForItem(at index: Int) -> UICollectionViewCell {
    guard let object = object,
      let cell = collectionContext?.dequeueReusableCell(of: PasswordCell.self,
                                                            for: self,
                                                            at: index) as? PasswordCell else {
                                                              return UICollectionViewCell()
    }
    cell.bindViewModel(object)
    cell.output = self
    return cell
  }
  
  override public func didUpdate(to object: Any) {
    self.object = object as? PasswordViewModel
  }
}

extension PasswordSectionController: PasswordCellOutput {
  public func didTapContinueButton() {
    output?.didTapContinueButton()
  }
  
  public func passwordDidChange(newVal: String) {
    output?.passwordDidChange(newVal: newVal)
  }
}
