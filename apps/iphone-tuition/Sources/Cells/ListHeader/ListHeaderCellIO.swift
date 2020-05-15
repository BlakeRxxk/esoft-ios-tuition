//
//  ListHeaderIO.swift
//  ESUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation
import UIKit

public protocol ListHeaderCellInput {
  var headerTitle: String { get set }
  var iconImage: UIImage? { get set }
}

public protocol ListHeaderCellOutput: class {
  func didTapAction(in cell: ListHeaderCellInput)
}
