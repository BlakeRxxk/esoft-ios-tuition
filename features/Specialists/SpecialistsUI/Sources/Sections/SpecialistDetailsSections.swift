//
//  SpecialistDetailsSections.swift
//  SpecialistsUI
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation
import ListKit
import EsoftUIKit
import IGListDiffKit.IGListDiffable

public enum SpecialistDetailsSections {
  case details(SpecialistViewModel)
  case detailsActions(SpecialistDetailsActionViewModel)
  case empty(EmptyListViewModel)
}

extension SpecialistDetailsSections: SectionModelType {
  public typealias ObjectType = ListDiffable
  
  public var object: ListDiffable {
    switch self {
    case let .details(specialistsViewModel):
      return specialistsViewModel
    case let .detailsActions(specialistDetailsActionViewModel):
      return specialistDetailsActionViewModel
    case let .empty(emptyViewModel):
      return emptyViewModel
    }
  }
}
