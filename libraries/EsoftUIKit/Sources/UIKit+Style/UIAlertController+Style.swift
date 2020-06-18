//
//  UIAlertController+Style.swift
//  EsoftUIKit
//
<<<<<<< HEAD
//  Copyright © 2020 E-SOFT. All rights reserved.
=======
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
>>>>>>> master
//

import UIKit
import Atlas
import ThemeManager

extension UIAlertController {
  public enum Styles {
<<<<<<< HEAD
    public static let `default` = Atlas.Style(name: "esoft.uialert.default") { (view: UIAlertController) in
      let titleFont = [NSAttributedString.Key.font: ThemeManager.current().fonts.regularSemibold]
      let messageFont = [NSAttributedString.Key.font: ThemeManager.current().fonts.tiny]
      
=======
    public static let `default` = Atlas.Style(name: "client.uialert.default") { (view: UIAlertController) in
      let titleFont = [NSAttributedString.Key.font: ThemeManager.current().fonts.regularSemibold]
      let messageFont = [NSAttributedString.Key.font: ThemeManager.current().fonts.tiny]

>>>>>>> master
      let titAttrString = NSMutableAttributedString(string: view.title ?? "", attributes: titleFont)
      let msgAttrString = NSMutableAttributedString(string: view.message ?? "", attributes: messageFont)
      
      view.setValue(titAttrString, forKey: "attributedTitle")
      view.setValue(msgAttrString, forKey: "attributedMessage")
      view.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = ThemeManager.current().colors.container
      view.view.tintColor = ThemeManager.current().colors.primary500
    }
  }
}
