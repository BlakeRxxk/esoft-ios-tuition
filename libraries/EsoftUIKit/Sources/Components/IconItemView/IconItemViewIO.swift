//
//  IconItemViewIO.swift
//  EsoftUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import UIKit

public protocol IconItemViewInput {
  var title: String { get set }
  var leftIcon: UIImage? { get set }
  var rightIcon: UIImage? { get set }
  var viewID: String { get set }
}

public protocol IconItemViewOutput: class {
  func didTapAction(in view: IconItemViewInput)
}
