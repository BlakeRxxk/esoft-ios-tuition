//
//  EditSellerPriceSections.swift
//  SellerTicketUI#iphonesimulator-x86_64
//
//  Created by wtildestar on 17/06/2020.
//

import Foundation
import ListKit
import EsoftUIKit
import IGListDiffKit.IGListDiffable

public enum EditSellerPriceSections {
  case header(ListHeaderViewModel)
  case empty(EmptyListViewModel)
  
  case listHeaderSkeleton(ListHeaderSkeletonViewModel)
  case skeleton(ListSkeletonViewModel)
  case editSellerPrice(EditSellerPriceViewModel)
}

extension EditSellerPriceSections: SectionModelType {
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
    case let .editSellerPrice(editSellerPriceViewModel):
      return editSellerPriceViewModel
    }
  }
}
