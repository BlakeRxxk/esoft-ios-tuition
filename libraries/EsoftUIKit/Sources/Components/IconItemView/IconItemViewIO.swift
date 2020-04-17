//
//  IconItemViewIO.swift
//  EsoftUIKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import UIKit

public protocol IconItemViewInput {
  var title: String { get set }
  var leftIcon: UIImage? { get set }
}

public protocol IconItemViewOutput: class {
  func didTapAction(in view: IconItemViewInput)
}
