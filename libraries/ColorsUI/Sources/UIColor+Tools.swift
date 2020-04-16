//
//  UIColor+Tools.swift
//  ColorsUI
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import UIKit

extension UIColor {
  public static func highlighted(from color: UIColor, alpha: CGFloat = 0.7) -> UIColor {
    color.withAlphaComponent(alpha)
  }
}
