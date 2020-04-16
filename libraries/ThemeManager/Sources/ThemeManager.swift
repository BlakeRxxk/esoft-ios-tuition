//
//  ThemeManager.swift
//  ThemeManager
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation
import UIKit

public class ThemeManager {
  public static let themeKey = "com.etagi.mobile.ThemeManager.SelectedTheme"
  
  public static func current() -> Theme {
    if let storedTheme = (UserDefaults.standard.value(forKey: themeKey) as AnyObject).integerValue {
      return Theme(rawValue: storedTheme)!
    } else {
      return .client
    }
  }
  
  // First persist the selected theme using NSUserDefaults.
  public static func apply(theme: Theme) {
    UserDefaults.standard.setValue(theme.rawValue, forKey: themeKey)
    UserDefaults.standard.synchronize()
  }
}
