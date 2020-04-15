//
//  UIButton+Stylable.swift
//  Atlas
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import UIKit

extension UIButton {
  
  public func setStyledTitle(_ text: String?, for state: UIControl.State) {
    guard text != nil else {
      setTitle(nil, for: state)
      setAttributedTitle(nil, for: state)
      return
    }
    setTitle(text, for: state)
    applyStyles()
  }
  
  public func styledTitle(for state: UIControl.State) -> String? {
    attributedTitle(for: state)?.string ?? title(for: state)
  }
}
