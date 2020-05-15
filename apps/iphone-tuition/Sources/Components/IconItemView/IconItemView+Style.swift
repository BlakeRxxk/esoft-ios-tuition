//
//  IconItemView+Style.swift
//  ESUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation
import Atlas
import EsoftUIKit
import UIKit

extension IconItemView {
  public enum Styles {
    
    public static let primary = Style(name: "icon.item.view.primary") { (item: IconItemView) in
      item.leftIconView.tintColor = AppTheme.current().colors.primary500
      item.bottomBorderMode = .never
      item.topBorderMode = .visible
      item.leftIconMode = .visible
      item.titleLabel.setStyles(
        UILabel.Styles.singleLine,
        UILabel.Styles.headline,
        UILabel.ColorStyle.primary500
      )
    }

    public static let inactive = Style(name: "icon.item.view.inactive") { (item: IconItemView) in
      item.leftIconView.tintColor = AppTheme.current().textColors.disabled
      item.bottomBorderMode = .never
      item.topBorderMode = .visible
      item.leftIconMode = .visible
      item.titleLabel.setStyles(
        UILabel.Styles.singleLine,
        UILabel.Styles.headline,
        UILabel.ColorStyle.disabled
      )
    }
    
    public static let dropDownItem = Style(name: "icon.item.view.dropdown") { (item: IconItemView) in
      item.rightIconView.tintColor = AppTheme.current().colors.primary500
      item.bottomBorderMode = .never
      item.topBorderMode = .never
      item.leftIconMode = .never
      item.rightIconMode = .visible
      item.titleLabel.appendStyle(UILabel.ColorStyle.primary)
    }
    
    public static let `default` = Style(name: "icon.item.view.default") { (item: IconItemView) in
      item.rightIconView.tintColor = AppTheme.current().colors.divider
      item.leftIconView.tintColor = AppTheme.current().colors.icon
      item.bottomBorderMode = .never
      item.topBorderMode = .visible
      item.leftIconMode = .visible
      item.rightIconMode = .visible
      item.titleLabel.appendStyle(UILabel.ColorStyle.primary)
    }
  }
}
