//
//  UILabel+Stylable.swift
//  Atlas
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import UIKit

extension UILabel {
  /**
   Property for work with text.
   Changing this property call `applyStyles` method and place new text to label's `text` property.
   
   - note: Use this method for changing the text without breakage the style.
   */
  public var styledText: String? {
    get {
      attributedText?.string ?? text
    }
    set {
      guard newValue != nil else {
        text = nil
        attributedText = nil
        return
      }
      text = newValue
      applyStyles()
    }
  }
}
