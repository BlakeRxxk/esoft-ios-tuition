//
//  LoginSections.swift
//  AuthUI#iphonesimulator-x86_64
//
//  Created by nedstar on 18.06.2020.
//

import Foundation
import ListKit
import EsoftUIKit
import IGListDiffKit.IGListDiffable

public enum LoginSections {
  case label(LabelViewModel)
  case input(AuthInputViewModel)
  case button(AuthButtonViewModel)
  case socials(SocialsViewModel)
}

extension LoginSections: SectionModelType {
  public typealias ObjectType = ListDiffable

  public var object: ListDiffable {
    switch self {
    case let .label(labelViewModel):
      return labelViewModel
    case let .input(authInputViewModel):
      return authInputViewModel
    case let .button(authButtonViewModel):
      return authButtonViewModel
    case let .socials(socialsViewModel):
      return socialsViewModel
    }
  }
}
