//
//  UnauthorizedListCellIO.swift
//  EsoftUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation

public protocol UnauthorizedListCellInput {}

public protocol UnauthorizedListCellOutput: class {
  func didTapActionButton(in cell: UnauthorizedListCellInput)
}
