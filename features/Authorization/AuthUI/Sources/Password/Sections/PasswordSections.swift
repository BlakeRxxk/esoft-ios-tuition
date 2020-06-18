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
  case password(PasswordViewModel)
}

extension PasswordSections: SectionModelType {
  public typealias ObjectType = ListDiffable

  public var object: ListDiffable {
    switch self {
    case let .password(passwordViewModel):
      return passwordViewModel
    }
  }
}
