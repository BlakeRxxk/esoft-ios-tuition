//
//  AuthCitiesSections+Array.swift
//  AppLibrary
//
//  Created by nedstar on 26.05.2020.
//

import EsoftUIKit
import IGListDiffKit.IGListDiffable

extension Array {
  public func mapToAuthCitiesSections() -> [CitiesSections] {
    map { obj -> CitiesSections in
      switch obj {
      case is ListHeaderViewModel:
        return .header(obj as! ListHeaderViewModel)
      case is LocationViewModel:
        return .location(obj as! LocationViewModel)
      case is CityViewModel:
        return .cities(obj as! CityViewModel)
      default:
        return .cities(obj as! CityViewModel) // заменить
      }
    }
  }
}
