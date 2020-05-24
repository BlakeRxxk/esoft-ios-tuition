//
//  IconView+Style.swift
//  EsoftUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import UIKit
import Atlas
import ThemeManager

extension IconView {
  public enum Styles {
    
    public enum Tint {
      public static let normal = Style(name: "IconView.tint.normal") { (view: IconView) in
        view.imageView.tintColor = view.tintColor
        view.backgroundColor = .clear
      }
      
      public static let highlighted = normal + Style(name: "IconView.tint.highlighted") { (view: IconView) in
        view.imageView.tintColor = UIColor.highlighted(from: view.tintColor)
      }
      
      public static let disabled = normal + Style(name: "IconView.tint.disabled") { (view: IconView) in
        view.imageView.tintColor = UIColor(white: 179 / 255, alpha: 1)
      }
    }
    
    static let dividerTint = Style(name: "IconView.dividerTint") { (view: IconView) in
      view.imageView.tintColor = ThemeManager.current().colors.divider
      view.backgroundColor = .clear
    }
  }
}
