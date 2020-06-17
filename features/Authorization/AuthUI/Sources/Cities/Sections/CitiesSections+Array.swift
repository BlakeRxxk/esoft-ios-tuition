//
//  AuthCitiesSections+Array.swift
//  AppLibrary
//
//  Created by nedstar on 26.05.2020.
//

import EsoftUIKit
import IGListDiffKit.IGListDiffable

extension Array {
  public func mapToCitiesSections() -> [CitiesSections] {
    map { obj -> CitiesSections in
      switch obj {
      case is ListHeaderViewModel:
        return .header(obj as! ListHeaderViewModel)
      case is MyCityViewModel:
        return .myCity(obj as! MyCityViewModel)
      case is CityViewModel:
        return .city(obj as! CityViewModel)
      case is MessageViewModel:
        return .message(obj as! MessageViewModel)
      default:
        fatalError("Неожиданный тип")
      }
    }
  }
}
