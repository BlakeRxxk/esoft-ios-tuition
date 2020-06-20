//
//  DiscountSections.swift
//  LoyaltyUI
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation
import ListKit
import EsoftUIKit
import LoyaltyCore
import IGListDiffKit.IGListDiffable

public enum DiscountSections {
  case empty(EmptyListViewModel)

//  case skeleton(DiscountSkeletonViewModel)
  case discount(DiscountViewModel)
}

extension DiscountSections: SectionModelType {
  public typealias ObjectType = ListDiffable
  
  public var object: ListDiffable {
    switch self {
    case let .empty(emptyListViewModel):
      return emptyListViewModel
//    case let .skeleton(listSkeleton):
//      return listSkeleton
    case let .discount(discountViewModel):
      return discountViewModel
    }
  }
}
