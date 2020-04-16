//
//  EtagiScheme.swift
//  ThemeManager
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import UIKit
import ColorsUI
import FontsUI

struct EtagiScheme: ThemeColors {
  var primary500: UIColor = UIColor.Color.mantis500
  var primary400: UIColor = UIColor.Color.mantis400
  var primary300: UIColor = .highlighted(from: UIColor.Color.mantis500, alpha: 0.5)
  
  var accent500: UIColor = UIColor.Color.sienna500
  var accent400: UIColor = UIColor.Color.sienna400
  var accent300: UIColor = .highlighted(from: UIColor.Color.sienna500, alpha: 0.5)
  
  var brand: UIColor = UIColor.Color.sienna500
  
  var system: UIColor = .systemBlue
  var systemHighlighted = UIColor.Color.systemHighlithed
  
  var warning: UIColor = .systemOrange
  var success: UIColor = .systemGreen
  var error: UIColor = .systemRed
  
  var container: UIColor = UIColor.BackgroundColor.whiteBackground
  var containerTranslucent: UIColor = .highlighted(from: UIColor.BackgroundColor.whiteBackground, alpha: 0.5)
  var searchBarContainer: UIColor = .highlighted(from: UIColor.TextColor.white, alpha: 0.12)
  var icon: UIColor = UIColor.BackgroundColor.icon
  
  var divider: UIColor = UIColor.BackgroundColor.divider
  var screen: UIColor = UIColor.BackgroundColor.screen
  var defaultTopBar: UIColor = UIColor.BackgroundColor.defaultTopBar
  var topBar: UIColor = UIColor.BackgroundColor.topBar
  var overlay: UIColor = UIColor.BackgroundColor.overlay
  var stub: UIColor = UIColor.BackgroundColor.stub
  var fabHighlighted: UIColor = UIColor.BackgroundColor.fabHighlighted
  
  var supernova: UIColor = UIColor.Color.supernova
  
  func getRandomAdditionalColor() -> UIColor {
    let colors = [
      UIColor.Color.mandysPink,
      UIColor.Color.halfBaked,
      UIColor.Color.mossGreen,
      UIColor.Color.peachYellow,
      UIColor.Color.saharaSand,
      UIColor.Color.frenchLilac,
      UIColor.Color.classicRose,
      UIColor.Color.cornflower,
      UIColor.Color.magicMint,
      UIColor.Color.iron
    ]
    
    return colors.randomElement() ?? colors[0]
  }
}

struct EtagiTextColors: ThemeTextColors {
  var primary: UIColor = UIColor.TextColor.primary
  var secondary: UIColor = UIColor.TextColor.secondary
  var placeholder: UIColor = UIColor.TextColor.placeholder
  var disabled: UIColor = UIColor.TextColor.disabled
  
  var white: UIColor = UIColor.TextColor.white
}

struct EtagiFonts: ThemeFonts {
  var title1: UIFont = UIFont.title1
  var title2: UIFont = UIFont.title2
  var title3: UIFont = UIFont.title3
  
  var regular: UIFont = UIFont.regular
  var regularSemibold: UIFont = UIFont.regularSemibold

  var small: UIFont = UIFont.small
  var smallSemibold: UIFont = UIFont.smallSemibold
  
  var tiny: UIFont = UIFont.tiny
  
  var micro: UIFont = UIFont.micro
}
