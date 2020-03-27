//
//  UIView+SpecificLayoutGuide.swift
//  AutoLayoutKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import class UIKit.UIView
import class UIKit.UILayoutGuide

extension UIView {
  
  @available(iOS 9.0, *)
  public var specificLayoutGuide: UILayoutGuide {
    if #available(iOS 11.0, *) {
      return safeAreaLayoutGuide
    } else {
      return layoutMarginsGuide
    }
  }
}
