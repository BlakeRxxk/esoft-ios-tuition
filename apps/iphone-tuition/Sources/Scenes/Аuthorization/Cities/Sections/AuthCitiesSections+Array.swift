//
//  AuthCitiesSections+Array.swift
//  AppLibrary
//
//  Created by nedstar on 25.05.2020.
//

import EsoftUIKit
import IGListDiffKit.IGListDiffable

extension Array {
  public func mapToAuthCitiesSections() -> [AuthCitiesSections] {
    map { obj -> AuthCitiesSections in
      switch obj {
      case is ListHeaderViewModel:
        return .header(obj as! ListHeaderViewModel)
      case is LocationViewModel:
        return .location(obj as! LocationViewModel)
      case is AuthCityViewModel:
        return .cities(obj as! AuthCityViewModel)
      default:
        return .cities(obj as! AuthCityViewModel) // заменить
      }
    }
  }
}
