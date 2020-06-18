//
//  LoginSectionController.swift
//  AuthUI#iphonesimulator-x86_64
//
//  Created by nedstar on 18.06.2020.
//

import IGListKit
import EsoftUIKit

public protocol LoginSectionControllerOutput: LoginCellOutput {}

public final class LoginSectionController: ListSectionController {
  weak var output: LoginSectionControllerOutput?
  
  public init(_ output: LoginSectionControllerOutput? = nil) {
    super.init()
    
    self.output = output
  }
  
  override public func sizeForItem(at index: Int) -> CGSize {
    guard let context = collectionContext else { return CGSize() }
    
    let width: CGFloat = context.containerSize.width
    
    var height: CGFloat = 400
    
    return CGSize(width: width, height: height)
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
