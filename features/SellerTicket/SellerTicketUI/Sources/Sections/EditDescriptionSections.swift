//
//  EditDescriptionSections.swift
//  SellerTicketUI#iphonesimulator-x86_64
//
//  Created by wtildestar on 25/06/2020.
//

import Foundation
import ListKit
import EsoftUIKit
import IGListDiffKit.IGListDiffable

public enum EditDescriptionSections {
  case header(ListHeaderViewModel)
  case empty(EmptyListViewModel)
  
  case editDescription(EditDescriptionViewModel)
}

extension EditDescriptionSections: SectionModelType {
  public typealias ObjectType = ListDiffable
  
  public var object: ListDiffable {
    switch self {
    case .header(let headerViewModel):
      return headerViewModel
    case let .empty(emptyListViewModel):
      return emptyListViewModel
    case let .editDescription(editDescriptionViewModel):
      return editDescriptionViewModel
    }
  }
}
