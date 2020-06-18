//
//  ListHeaderIO.swift
//  ESUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation
import UIKit

public protocol ListHeaderViewInput {
  var headerTitle: String { get set }
  var iconImage: UIImage? { get set }
}

public protocol ListHeaderViewOutput: class {
  func didTapAction(in headerView: ListHeaderViewInput)
}
