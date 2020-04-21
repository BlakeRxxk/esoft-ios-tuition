//
//  UINavigationBar+Style.swift
//  EsoftUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import UIKit
import Atlas
import ThemeManager

extension UINavigationBar {
  
  public enum Styles {
    
    // MARK: - Main styles
    
    public static let `default` = Style(name: "client.uinavigation.default") { (view: UINavigationBar) in
      view.isTranslucent = false
      view.barTintColor = ThemeManager.current().colors.defaultTopBar
      view.tintColor = ThemeManager.current().textColors.white
      view.titleTextAttributes = [
        .foregroundColor: ThemeManager.current().textColors.white
      ]
      view.shadowImage = nil
      view.layoutMargins = UIEdgeInsets(top: 0,
                                        left: Space.small,
                                        bottom: 0,
                                        right: Space.small)
      view.preservesSuperviewLayoutMargins = true
    }
    
    public static let modal = Style(name: "client.uinavigation.modal") { (view: UINavigationBar) in
      view.isTranslucent = false
      view.barTintColor = ThemeManager.current().colors.topBar
      view.tintColor = ThemeManager.current().colors.primary500
      view.layoutMargins = UIEdgeInsets(top: 0,
                                        left: Space.small,
                                        bottom: 0,
                                        right: Space.small)
      
      view.preservesSuperviewLayoutMargins = true
    }
    
    public static let auth = Style(name: "client.uinavigation.auth") { (view: UINavigationBar) in
      view.isTranslucent = false
      view.backgroundColor = .clear
      view.barTintColor = ThemeManager.current().colors.container
      view.tintColor = ThemeManager.current().colors.accent500
      view.shadowImage = UIImage()
      view.layoutMargins = UIEdgeInsets(top: 0,
                                        left: Space.small,
                                        bottom: 0,
                                        right: Space.small)
      
      view.preservesSuperviewLayoutMargins = true
      
      // ios 10 border fix
      view.setBackgroundImage(UIImage(), for: .default)
    }
    
    public static let black = Style(name: "black") { (view: UINavigationBar) in
      view.barTintColor = .black
      view.barStyle = .black
      view.isTranslucent = false
      view.tintColor = ThemeManager.current().colors.container
      view.shadowImage = UIImage()
      view.layoutMargins = UIEdgeInsets(top: 0,
                                        left: Space.small,
                                        bottom: 0,
                                        right: Space.small)
      
      view.preservesSuperviewLayoutMargins = true
    }
  }
}
