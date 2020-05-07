//
//  SocialStack.swift
//  AppLibrary
//
//  Created by nedstar on 24.04.2020.
//

import UIKit
import YogaKit
import ThemeManager
import BaseUI

extension UILabel {
  func colorize(from: Int, to: Int, with color: UIColor) {
    guard let atrText = self.attributedText else {
      return
    }
    let temp: NSMutableAttributedString = NSMutableAttributedString(attributedString: atrText)
    temp.addAttribute(.foregroundColor, value: color, range: NSRange(location: from, length: to - from + 1))
    self.attributedText = temp
  }
}
