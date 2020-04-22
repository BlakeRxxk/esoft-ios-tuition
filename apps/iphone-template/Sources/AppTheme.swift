//
//  AppTheme.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import ThemeManager

public struct Theme {
  public static let colors = AppTheme.current().colors
  public static let textColors = AppTheme.current().textColors
}

public typealias AppTheme = ThemeManager
