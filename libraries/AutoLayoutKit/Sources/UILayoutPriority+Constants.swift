//
//  UILayoutPriority+Constants.swift
//  AutoLayoutKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import struct UIKit.UILayoutPriority

extension UILayoutPriority {
  public static let highest = UILayoutPriority.required - 1
}

extension UILayoutPriority {
  public static func + (left: UILayoutPriority, right: Float) -> UILayoutPriority {
    UILayoutPriority(rawValue: left.rawValue + right)
  }
  
  public static func - (left: UILayoutPriority, right: Float) -> UILayoutPriority {
    UILayoutPriority(rawValue: left.rawValue - right)
  }
}
