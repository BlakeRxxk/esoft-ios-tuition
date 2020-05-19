//
//  UIBarButtonItem+Style.swift
//  EsoftUIKit#iphonesimulator-x86_64
//
//  Created by nedstar on 21.04.2020.
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
    
    public static let back = Atlas.Style(name: "back") { (item: UIBarButtonItem) in
      item.style = .plain
      item.image = UIImage.Arrow.Left.base
    }
  }
}
