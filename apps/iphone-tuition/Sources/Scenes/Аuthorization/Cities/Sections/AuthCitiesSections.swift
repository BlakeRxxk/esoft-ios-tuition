//
//  AuthCitiesSections.swift
//  AppLibrary
//
//  Created by nedstar on 25.05.2020.
//

import Foundation
import ListKit
import EsoftUIKit
import IGListDiffKit.IGListDiffable

public enum AuthCitiesSections {
  case header(ListHeaderViewModel)
  case location(LocationViewModel)
  case cities(AuthCityViewModel)
}

extension AuthCitiesSections: SectionModelType {
  public typealias ObjectType = ListDiffable

  public var object: ListDiffable {
    switch self {
    case let .header(headerViewModel):
      return headerViewModel
    case let .location(LocationViewModel):
      return LocationViewModel
    case let .cities(cityViewModel):
      return cityViewModel
    }
  }
}
