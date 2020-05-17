//
//  UIView+Style.swift
//  EsoftUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation
import UIKit
import Atlas
import ThemeManager

extension UIView {
  public enum Styles {

    public static let stubTitleBackground = Style(name: "stubTitleBackground") { (view: UIView) in
      view.backgroundColor = ThemeManager.current().colors.divider
    }

    public static let cornerRadiusTiny = Style(name: "cornerradius.tiny") { (view: UIView) in
      view.layer.cornerRadius = Space.tiny
    }

  }
}
