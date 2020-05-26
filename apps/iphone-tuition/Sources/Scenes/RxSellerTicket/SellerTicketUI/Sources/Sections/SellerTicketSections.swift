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
  
  case listHeaderSkeleton(ListHeaderSkeletonViewModel)
  case skeleton(ListSkeletonViewModel)
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
    case let .listHeaderSkeleton(listHeaderSkeleton):
      return listHeaderSkeleton
    case let .skeleton(listSkeleton):
      return listSkeleton
    case let .sellerTicket(sellerTicketViewModel):
      return sellerTicketViewModel
    }
  }
}
