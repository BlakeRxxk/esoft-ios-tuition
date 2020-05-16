//
//  UIBarButtonItem+Style.swift
//  EsoftUIKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import UIKit
import Atlas
import ThemeManager

extension UIBarButtonItem {
  
  public enum Styles {
    
    public static let close = Atlas.Style(name: "close") { (item: UIBarButtonItem) in
      item.style = .plain
      item.image = UIImage.Close.base
    }
  }
}
