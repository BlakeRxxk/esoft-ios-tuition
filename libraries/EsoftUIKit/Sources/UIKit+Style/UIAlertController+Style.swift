//
//  UIAlertController+Style.swift
//  EsoftUIKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import UIKit
import Atlas
import ThemeManager

extension UIAlertController {
  public enum Styles {
    public static let `default` = Atlas.Style(name: "esoft.uialert.default") { (view: UIAlertController) in
      let titleFont = [NSAttributedString.Key.font: ThemeManager.current().fonts.regularSemibold]
      let messageFont = [NSAttributedString.Key.font: ThemeManager.current().fonts.tiny]
      
      let titAttrString = NSMutableAttributedString(string: view.title ?? "", attributes: titleFont)
      let msgAttrString = NSMutableAttributedString(string: view.message ?? "", attributes: messageFont)
      
      view.setValue(titAttrString, forKey: "attributedTitle")
      view.setValue(msgAttrString, forKey: "attributedMessage")
      view.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = ThemeManager.current().colors.container
      view.view.tintColor = ThemeManager.current().colors.primary500
    }
  }
}
