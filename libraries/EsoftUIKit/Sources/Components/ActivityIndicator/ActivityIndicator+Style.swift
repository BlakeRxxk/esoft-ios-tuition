//
//  ActivityIndicator+Style.swift
//  EsoftUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Atlas
import UIKit
import ThemeManager

extension ActivityIndicator {
  
  public enum Styles {
    public static let `default` = Styles.primary + Styles.medium + Styles.mediumStroke
    
    public static let primary =
      Style(name: "ActivityIndicator.primary") { (item: ActivityIndicator) in
        item.spinnerColor = ThemeManager.current().colors.primary500
    }
    
    public static let medium = Style(name: "medium") { (activity: ActivityIndicator) in
      activity.spinnerSize = Space.base
    }
    
    public static let mediumStroke = Style(name: "mediumStroke") { (activity: ActivityIndicator) in
      activity.strokeWidth = 2
    }
  }
}
