//
//  UIView+Style.swift
//  EsoftUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation
import UIKit
import YogaKit
import Atlas
import ThemeManager

extension UIView {
  public enum Styles {
    
    public static let divider = Style(name: "divider") { (view: UIView) in
      view.backgroundColor = ThemeManager.current().colors.divider
      view.yoga.height = YGValue(1 / UIScreen.main.scale)
    }
    
    public static let transparent = Style(name: "transparent") { (view: UIView) in
      view.backgroundColor = .clear
    }
    
    public static let semiTransparent = Style(name: "semiTransparent") { (view: UIView) in
      view.backgroundColor = ThemeManager.current().colors.overlay
    }
    
    public static let semiTransparentWhite = Style(name: "semiTransparentWhite") { (view: UIView) in
      view.backgroundColor = ThemeManager.current().colors.containerTranslucent
       }
    
    public static let defaultBackground = Style(name: "defaultBackground") { (view: UIView) in
      view.backgroundColor = ThemeManager.current().colors.screen
    }
    
    public static let stubBackground = Style(name: "stubBackground") { (view: UIView) in
      view.backgroundColor = ThemeManager.current().colors.stub
    }
    
    public static let stubTitleBackground = Style(name: "stubTitleBackground") { (view: UIView) in
      view.backgroundColor = ThemeManager.current().colors.divider
    }
    
    public static let errorBackground = Style(name: "errorBackground") { (view: UIView) in
      view.backgroundColor = ThemeManager.current().colors.error
    }
    
    public static let brandBackground = Style(name: "brandBackground") { (view: UIView) in
      view.backgroundColor = ThemeManager.current().colors.brand
    }
    
    public static let messageBubblePrimary = Style(name: "chat.bubble.primary") { (view: UIView) in
      view.backgroundColor = ThemeManager.current().colors.primary500
    }
    
    public static let whiteBackground = Style(name: "whiteBackground") { (view: UIView) in
      view.backgroundColor = ThemeManager.current().colors.container
    }
    
    public static let alwaysWhiteBackground = Style(name: "alwaysWhiteBackground") { (view: UIView) in
      view.backgroundColor = ThemeManager.current().textColors.white
    }
    
    public static let cornerRadiusMicro = Style(name: "cornerradius.micro") { (view: UIView) in
      view.layer.cornerRadius = Space.tiny / 2
    }
    
    public static let avatar = Style(name: "avatar.rounded.base") { (view: UIView) in
      view.layer.cornerRadius = Space.base
      view.clipsToBounds = true
    }
    
    public static let avatarToolbar = Style(name: "avatar.rounded.toolbar") { (view: UIView) in
      view.layer.cornerRadius = 17.0
      view.clipsToBounds = true
    }
    
    public static let cornerRadiusTiny = Style(name: "cornerradius.tiny") { (view: UIView) in
      view.layer.cornerRadius = Space.tiny
    }
    
    public static let cornerRadiusSmall = Style(name: "cornerradius.small") { (view: UIView) in
      view.layer.cornerRadius = Space.small
    }

    public static let defaultBorder = Style(name: "defaultBorder") { (view: UIView) in
      view.layer.borderColor = ThemeManager.current().colors.divider.cgColor
      view.layer.borderWidth = 1
    }
    
    public static let thinBorder = Style(name: "thinBorder") { (view: UIView) in
      view.layer.borderColor = ThemeManager.current().colors.divider.cgColor
      view.layer.borderWidth = 0.5
    }
    
    public static let shadowCard300 = Style(name: "shadowCard300") { (view: UIView) in
      view.layer.shadowColor = UIColor.black.cgColor
      view.layer.shadowOpacity = 0.16
      view.layer.shadowRadius = Space.base
      view.layer.shadowOffset = CGSize(width: 0, height: Space.base)
      view.layer.masksToBounds = false
    }
    
    public static let shadowCard200 = Style(name: "shadowCard200") { (view: UIView) in
      view.layer.shadowColor = UIColor.black.cgColor
      view.layer.shadowOpacity = 0.12
      view.layer.shadowRadius = Space.base
      view.layer.shadowOffset = CGSize(width: 0, height: Space.base / 2)
      view.layer.masksToBounds = false
    }
    
    public static let shadowCard100 = Style(name: "shadowCard100") { (view: UIView) in
      view.layer.shadowColor = UIColor.black.cgColor
      view.layer.shadowOpacity = 0.08
      view.layer.shadowRadius = Space.small
      view.layer.shadowOffset = CGSize(width: 0, height: Space.tiny)
      view.layer.masksToBounds = false
    }
    
    public static let shadowFab = Style(name: "shadowFab") { (view: UIView) in
      view.layer.shadowColor = UIColor.black.cgColor
      view.layer.shadowOpacity = 0.12
      view.layer.shadowRadius = Space.tiny
      view.layer.shadowOffset = CGSize(width: 0, height: 0)
      view.layer.masksToBounds = false
    }
    
    public static let actionSheetBlur = Style(name: "actionSheetBlur") { (view: UIView) in
      let blurEffect = UIBlurEffect(style: .dark)
      
      let blurEffectView = UIVisualEffectView(effect: blurEffect)
      blurEffectView.frame = view.bounds
      blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
      blurEffectView.alpha = 0.78

      let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
      let vibrancyEffectView = UIVisualEffectView(effect: vibrancyEffect)
      vibrancyEffectView.frame = view.bounds
      
      // Add the vibrancy view to the blur view
      blurEffectView.contentView.addSubview(vibrancyEffectView)

      view.addSubview(blurEffectView)
    }
  }
}
