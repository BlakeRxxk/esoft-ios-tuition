//
//  LoginSections+Array.swift
//  AuthUI#iphonesimulator-x86_64
//
//  Created by nedstar on 18.06.2020.
//

import EsoftUIKit
import IGListDiffKit.IGListDiffable

extension Array {
  public func mapToLoginSections() -> [LoginSections] {
    map { obj -> LoginSections in
      switch obj {
      case is SingleViewModel:
        return .single(obj as! SingleViewModel)
      default:
        fatalError("Неожиданный тип")
      }
    }
  }
}
