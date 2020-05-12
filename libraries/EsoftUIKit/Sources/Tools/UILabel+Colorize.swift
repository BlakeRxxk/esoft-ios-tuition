//
//  UIImage+Tools.swift
//  EsoftUIKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import UIKit

extension UILabel {
  public func colorize(from: Int, to: Int, with color: UIColor) {
    guard let atrText = self.attributedText else {
      return
    }
    let temp: NSMutableAttributedString = NSMutableAttributedString(attributedString: atrText)
    temp.addAttribute(.foregroundColor, value: color, range: NSRange(location: from, length: to - from + 1))
    self.attributedText = temp
  }
}
