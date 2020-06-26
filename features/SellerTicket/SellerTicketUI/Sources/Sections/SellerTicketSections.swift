//
//  SellerTicketSections.swift
//  AppLibrary
//
//  Created by wtildestar on 23/05/2020.
//

import Foundation
import ListKit
import EsoftUIKit
import IGListDiffKit.IGListDiffable

public enum SellerTicketSections {
  case header(ListHeaderViewModel)
  case empty(EmptyListViewModel)
  
  case sellerTicket(SellerTicketViewModel)
}

extension SellerTicketSections: SectionModelType {
  public typealias ObjectType = ListDiffable
  
  public var object: ListDiffable {
    switch self {
    case .header(let headerViewModel):
      return headerViewModel
    case let .empty(emptyListViewModel):
      return emptyListViewModel
    case let .sellerTicket(sellerTicketViewModel):
      return sellerTicketViewModel
    }
  }
}
