//
//  PasswordSections.swift
//  AuthUI#iphonesimulator-x86_64
//
//  Created by nedstar on 18.06.2020.
//

import Foundation
import ListKit
import EsoftUIKit
import IGListDiffKit.IGListDiffable

public enum PasswordSections {
  case label(LabelViewModel)
  case input(AuthInputViewModel)
  case button(AuthButtonViewModel)
}

extension PasswordSections: SectionModelType {
  public typealias ObjectType = ListDiffable

  public var object: ListDiffable {
    switch self {
    case let .label(labelViewModel):
      return labelViewModel
    case let .input(authInputViewModel):
      return authInputViewModel
    case let .button(authButtonViewModel):
      return authButtonViewModel
    }
  }
}
