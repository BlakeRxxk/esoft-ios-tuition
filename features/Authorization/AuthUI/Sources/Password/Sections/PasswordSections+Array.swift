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
      case is PasswordViewModel:
        return .password(obj as! PasswordViewModel)
      default:
        fatalError("Неожиданный тип")
      }
    }
  }
}
