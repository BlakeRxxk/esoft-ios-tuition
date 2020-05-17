//
//  DiscountViewModel.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation
import IGListKit

public final class DiscountViewModel {
  let id: Int
  let companyName: String
  let category: String
  let discountType: String
  let discountDescription: String
  let whyYouCanUseDescription: String
  let useDiscount: String

  public init(id: Int,
              companyName: String,
              category: String,
              discountType: String,
              discountDescription: String,
              whyYouCanUseDescription: String,
              useDiscount: String) {
    self.id = id
    self.companyName = companyName
    self.category = category
    self.discountType = discountType
    self.discountDescription = discountDescription
    self.whyYouCanUseDescription = whyYouCanUseDescription
    self.useDiscount = useDiscount
  }
}

extension DiscountViewModel: ListDiffable {
  public func diffIdentifier() -> NSObjectProtocol {
    id as NSObjectProtocol
  }

  public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    guard self !== object else { return true }
    guard let object = object as? CityViewModel else { return false }
    return id == object.id
  }
}

extension DiscountViewModel: Equatable {
  public static func == (lhs: DiscountViewModel, rhs: DiscountViewModel) -> Bool {
    lhs.id == rhs.id
  }
}
