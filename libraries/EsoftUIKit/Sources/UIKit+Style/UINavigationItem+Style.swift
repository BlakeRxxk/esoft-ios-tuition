//
//  UINavigationItem+Style.swift
//  EsoftUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import UIKit
import Atlas
import ThemeManager

extension UINavigationItem {
  
  public enum Styles {
    
    public static let logo = Atlas.Style(name: "etagi.logo") { (item: UINavigationItem) in
      let image = UIImageView(image: UIImage.Logo.base)
      image.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 8, right: 0)
      image.tintColor = ThemeManager.current().colors.brand
      item.titleView = image
    }
  }
}
