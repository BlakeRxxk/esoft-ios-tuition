//
//  AuthCitiesSections.swift
//  AppLibrary
//
//  Created by nedstar on 26.05.2020.
//

import Foundation
import ListKit
import EsoftUIKit
import IGListDiffKit.IGListDiffable

public enum CitiesSections {
  case header(ListHeaderViewModel)
  case location(LocationViewModel)
  case city(CityViewModel)
  case message(MessageViewModel)
}

extension CitiesSections: SectionModelType {
  public typealias ObjectType = ListDiffable

  public var object: ListDiffable {
    switch self {
    case let .header(headerViewModel):
      return headerViewModel
    case let .location(locationViewModel):
      return locationViewModel
    case let .city(cityViewModel):
      return cityViewModel
    case let .message(messageViewModel):
      return messageViewModel
    }
  }
}
