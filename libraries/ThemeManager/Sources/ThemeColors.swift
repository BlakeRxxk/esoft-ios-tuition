//
//  ThemeColors.swift
//  ThemeManager
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import UIKit

public protocol ThemeTextColors {
  var primary: UIColor { get }
  var secondary: UIColor { get }
  var placeholder: UIColor { get }
  var disabled: UIColor { get }
  
  var white: UIColor { get }
}

public protocol ThemeFonts {
  var title1: UIFont { get }
  var title2: UIFont { get }
  var title3: UIFont { get }
  var regular: UIFont { get }
  var regularSemibold: UIFont { get }
  var small: UIFont { get }
  var smallSemibold: UIFont { get }
  var tiny: UIFont { get }
  var micro: UIFont { get }
}

public protocol ThemeColors {
  var primary500: UIColor { get }
  var primary400: UIColor { get }
  var primary300: UIColor { get }
  
  var accent500: UIColor { get }
  var accent400: UIColor { get }
  var accent300: UIColor { get }
  
  var brand: UIColor { get }
  
  var system: UIColor { get }
  var systemHighlighted: UIColor { get }
  
  var warning: UIColor { get }
  var success: UIColor { get }
  var error: UIColor { get }
  
  var container: UIColor { get }
  var containerTranslucent: UIColor { get }
  var searchBarContainer: UIColor { get }
  var icon: UIColor { get }

  var divider: UIColor { get }
  var screen: UIColor { get }
  var topBar: UIColor { get }
  var defaultTopBar: UIColor { get }
  var overlay: UIColor { get }
  var stub: UIColor { get }
  var fabHighlighted: UIColor { get }
  
  var supernova: UIColor { get }
  
  func getRandomAdditionalColor() -> UIColor
}
