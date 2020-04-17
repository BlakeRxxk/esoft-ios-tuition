//
//  IconItemView+Style.swift
//  EsoftUIKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import UIKit
import Foundation
import ThemeManager
import Atlas

extension IconItemView {
  public enum Styles {
    public static let normal = Style(name: "icon.item.default") { (component: IconItemView) in
      component.iconView.tintColor = ThemeManager.current().colors.icon
      component.titleLabel.setStyles(
        UILabel.Styles.headline,
        UILabel.ColorStyle.primary
      )
    }
    
    public static let greeny = Style(name: "icon.item.greeny") { (component: IconItemView) in
      component.iconView.tintColor = ThemeManager.current().colors.primary500
      component.titleLabel.setStyles(
        UILabel.Styles.headline,
        UILabel.ColorStyle.primary500
      )
    }
  }
}
