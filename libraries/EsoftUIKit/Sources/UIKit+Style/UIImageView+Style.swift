//
//  UIImageView+Style.swift
//  ESUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import UIKit
import Atlas

extension UIImageView {
  
  public enum Styles {
    
    // scale aspect fill content mode, adjusts image size for accessibility content size category is on.
    public static let dynamicSize = Style(name: "UIImageView.dynamicSize") { (imageView: UIImageView) in
      if #available(iOS 11.0, *) {
        imageView.adjustsImageSizeForAccessibilityContentSizeCategory = true
      }
      imageView.contentMode = .scaleAspectFill
    }
  }
}
