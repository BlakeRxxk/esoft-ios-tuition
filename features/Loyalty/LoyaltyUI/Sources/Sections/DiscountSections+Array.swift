//
//  DiscountSections+Array.swift
//  LoyaltyUI
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import EsoftUIKit
import LoyaltyCore
import IGListDiffKit.IGListDiffable

extension Array {
  public func mapToDiscountSections() -> [DiscountSections] {
    map { obj -> DiscountSections in
      switch obj {
      case is EmptyListViewModel:
        return .empty(obj as! EmptyListViewModel)
//      case is DiscountSkeletonViewModel:
//        return .skeleton(obj as! DiscountSkeletonViewModel)
      case is DiscountViewModel:
        return .discount(obj as! DiscountViewModel)
      default:
        return .empty(EmptyListViewModel(title: "", message: "", image: UIImage()))
      }
    }
  }
}
