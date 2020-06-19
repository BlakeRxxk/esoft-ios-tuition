//
//  PasswordSections+Array.swift
//  AuthUI#iphonesimulator-x86_64
//
//  Created by nedstar on 18.06.2020.
//

import EsoftUIKit
import IGListDiffKit.IGListDiffable

extension Array {
  public func mapToPasswordSections() -> [PasswordSections] {
    map { obj -> PasswordSections in
      switch obj {
      case is LabelViewModel:
        return .label(obj as! LabelViewModel)
      case is AuthInputViewModel:
        return .input(obj as! AuthInputViewModel)
      case is AuthButtonViewModel:
        return .button(obj as! AuthButtonViewModel)
      default:
        fatalError("Неожиданный тип")
      }
    }
  }
}
