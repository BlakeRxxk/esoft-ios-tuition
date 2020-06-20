//
//  DiscountCellIO.swift
//  LoyaltyUI
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation

public protocol DiscountCellInput {}

public protocol DiscountCellOutput: class {
  func pressBackOnNavbar(in cell: DiscountCellInput)
}
