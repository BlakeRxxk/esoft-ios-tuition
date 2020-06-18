//
//  LoginCellIO.swift
//  AuthUI#iphonesimulator-x86_64
//
//  Created by nedstar on 18.06.2020.
//

import EsoftUIKit

public protocol LoginCellOutput: AnyObject {
  func didTapSocial(social: SocialProviders)
  func didTapContinueButton()
  func phoneDidChange(newVal: String)
}
