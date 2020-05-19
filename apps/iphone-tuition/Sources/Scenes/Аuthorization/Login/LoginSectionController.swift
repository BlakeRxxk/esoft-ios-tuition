//
//  LoginSectionController.swift
//  AppLibrary
//
//  Created by nedstar on 19.05.2020.
//

import IGListKit
import EsoftUIKit

public protocol LoginSectionControllerOutput: class {
  func didTapSocial(social: SocialProviders)
  func didTapContinueButton()
  func phoneDidChange(newVal: String)
}

public final class LoginSectionController: ListSectionController {
  private var object: LoginViewModel?

  weak var output: LoginSectionControllerOutput?
  
  public convenience init(output: LoginSectionControllerOutput?, inset: UIEdgeInsets? = nil) {
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
    guard
      let context = collectionContext,
      let object = object
      else { return CGSize() }
    
    let width: CGFloat = context.containerSize.width
    
    return CGSize(width: width, height: 382 + (object.keyboardHeight ?? 0)) // 382 - хардкод
  }
  
  override public func cellForItem(at index: Int) -> UICollectionViewCell {
    guard let cell = collectionContext?.dequeueReusableCell(of: LoginCell.self,
                                                            for: self,
                                                            at: index) as? LoginCell else {
                                                              return UICollectionViewCell()
    }
    cell.output = self
    return cell
  }

  override public func didUpdate(to object: Any) {
    self.object = object as? LoginViewModel
  }
}

extension LoginSectionController: LoginCellOutput {
  public func didTapSocial(social: SocialProviders) {
    output?.didTapSocial(social: social)
  }
  
  public func didTapContinueButton() {
    output?.didTapContinueButton()
  }
  
  public func phoneDidChange(newVal: String) {
    output?.phoneDidChange(newVal: newVal)
  }
}
