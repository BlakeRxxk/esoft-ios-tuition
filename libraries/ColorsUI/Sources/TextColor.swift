//
//  TextColor.swift
//  ColorsUI
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import UIKit

extension UIColor {
  public struct TextColor {
    @nonobjc public static var primary: UIColor {
      if #available(iOS 13.0, *) {
        return UIColor { (traits: UITraitCollection) -> UIColor in
          switch traits.userInterfaceStyle {
          case .dark:
              return UIColor(red: 1, green: 1, blue: 1, alpha: 0.87)
          case .light, .unspecified:
              return UIColor(red: 0, green: 0, blue: 0, alpha: 0.87)
          @unknown default:
              return UIColor(red: 0, green: 0, blue: 0, alpha: 0.87)
          }
        }
      } else {
        return UIColor(red: 0, green: 0, blue: 0, alpha: 0.87)
      }
    }
    
    @nonobjc public static var secondary: UIColor {
      if #available(iOS 13.0, *) {
        return UIColor { (traits: UITraitCollection) -> UIColor in
          switch traits.userInterfaceStyle {
          case .dark:
              return UIColor(red: 1, green: 1, blue: 1, alpha: 0.54)
          case .light, .unspecified:
            return UIColor(red: 0, green: 0, blue: 0, alpha: 0.54)
          @unknown default:
              return UIColor(red: 0, green: 0, blue: 0, alpha: 0.54)
          }
        }
      } else {
        return UIColor(red: 0, green: 0, blue: 0, alpha: 0.54)
      }
    }
    
    @nonobjc public static var placeholder: UIColor {
      if #available(iOS 13.0, *) {
        return UIColor { (traits: UITraitCollection) -> UIColor in
          switch traits.userInterfaceStyle {
          case .dark:
              return UIColor(red: 1, green: 1, blue: 1, alpha: 0.38)
          case .light, .unspecified:
            return UIColor(red: 0, green: 0, blue: 0, alpha: 0.38)
          @unknown default:
              return UIColor(red: 0, green: 0, blue: 0, alpha: 0.38)
          }
        }
      } else {
        return UIColor(red: 0, green: 0, blue: 0, alpha: 0.38)
      }
    }
    
    @nonobjc public static var disabled: UIColor {
      if #available(iOS 13.0, *) {
        return UIColor { (traits: UITraitCollection) -> UIColor in
          switch traits.userInterfaceStyle {
          case .dark:
              return UIColor(red: 1, green: 1, blue: 1, alpha: 0.24)
          case .light, .unspecified:
            return UIColor(red: 0, green: 0, blue: 0, alpha: 0.24)
          @unknown default:
              return UIColor(red: 0, green: 0, blue: 0, alpha: 0.24)
          }
        }
      } else {
        return UIColor(red: 0, green: 0, blue: 0, alpha: 0.24)
      }
    }
    
    @nonobjc public static var white: UIColor {
      UIColor(white: 1, alpha: 1)
    }
  }
}
