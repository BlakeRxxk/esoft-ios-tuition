//
//  Theme.swift
//  ThemeManager
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation

public enum Theme: Int {
  case client
  
  public var colors: ThemeColors {
    switch self {
    case .client:
      return EtagiScheme()
    }
  }
  
  public var textColors: ThemeTextColors {
    switch self {
    case .client:
      return EtagiTextColors()
    }
  }
  
  public var fonts: ThemeFonts {
    switch self {
    case .client:
      return EtagiFonts()
    }
  }
}
