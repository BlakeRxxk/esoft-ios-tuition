//
//  Colors.swift
//  ColorsUI
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import UIKit

extension UIColor {
  public struct Color {
    @nonobjc public static var mantis500: UIColor {
      if #available(iOS 13.0, *) {
        return UIColor { (traits: UITraitCollection) -> UIColor in
          switch traits.userInterfaceStyle {
          case .dark:
              return UIColor(red: 0.231, green: 0.812, blue: 0.369, alpha: 1)
          case .light, .unspecified:
              return UIColor(red: 0.204, green: 0.78, blue: 0.349, alpha: 1)
          @unknown default:
              return UIColor(red: 0.204, green: 0.78, blue: 0.349, alpha: 1)
          }
        }
      } else {
        return UIColor(red: 0.204, green: 0.78, blue: 0.349, alpha: 1)
      } 
    }
    
    @nonobjc public static var mantis400: UIColor {
      if #available(iOS 13.0, *) {
        return UIColor { (traits: UITraitCollection) -> UIColor in
          switch traits.userInterfaceStyle {
          case .dark:
              return UIColor(red: 0.267, green: 0.729, blue: 0.376, alpha: 1)
          case .light, .unspecified:
              return UIColor(red: 0.343, green: 0.88, blue: 0.485, alpha: 1)
          @unknown default:
              return UIColor(red: 0.343, green: 0.88, blue: 0.485, alpha: 1)
          }
        }
      } else {
        return UIColor(red: 0.343, green: 0.88, blue: 0.485, alpha: 1)
      }
    }
    
    @nonobjc public static var sienna500: UIColor {
      if #available(iOS 13.0, *) {
        return UIColor { (traits: UITraitCollection) -> UIColor in
          switch traits.userInterfaceStyle {
          case .dark:
              return UIColor(red: 0.922, green: 0.353, blue: 0.275, alpha: 1)
          case .light, .unspecified:
              return UIColor(red: 0.922, green: 0.353, blue: 0.275, alpha: 1)
          @unknown default:
              return UIColor(red: 0.922, green: 0.353, blue: 0.275, alpha: 1)
          }
        }
      } else {
        return UIColor(red: 0.922, green: 0.353, blue: 0.275, alpha: 1)
      }
    }

    @nonobjc public static var sienna400: UIColor {
      if #available(iOS 13.0, *) {
        return UIColor { (traits: UITraitCollection) -> UIColor in
          switch traits.userInterfaceStyle {
          case .dark:
              return UIColor(red: 0.937, green: 0.459, blue: 0.392, alpha: 1)
          case .light, .unspecified:
              return UIColor(red: 0.937, green: 0.459, blue: 0.392, alpha: 1)
          @unknown default:
              return UIColor(red: 0.937, green: 0.459, blue: 0.392, alpha: 1)
          }
        }
      } else {
        return UIColor(red: 0.937, green: 0.459, blue: 0.392, alpha: 1)
      }
    }

    // end client primary and accent colors
    @nonobjc public static var brand: UIColor {
      if #available(iOS 13.0, *) {
        return UIColor { (traits: UITraitCollection) -> UIColor in
          switch traits.userInterfaceStyle {
          case .dark:
              return UIColor(red: 0.706, green: 0.129, blue: 0.141, alpha: 1)
          case .light, .unspecified:
              return UIColor(red: 0.706, green: 0.129, blue: 0.141, alpha: 1)
          @unknown default:
              return UIColor(red: 0.706, green: 0.129, blue: 0.141, alpha: 1)
          }
        }
      } else {
        return UIColor(red: 0.706, green: 0.129, blue: 0.141, alpha: 1)
      }
    }

    @nonobjc public static var systemHighlithed: UIColor {
      if #available(iOS 13.0, *) {
        return UIColor { (traits: UITraitCollection) -> UIColor in
          switch traits.userInterfaceStyle {
          case .dark:
              return UIColor(red: 0.074, green: 0.406, blue: 0.74, alpha: 1)
          case .light, .unspecified:
              return UIColor(red: 0, green: 0.431, blue: 0.9, alpha: 1)
          @unknown default:
              return UIColor(red: 0, green: 0.431, blue: 0.9, alpha: 1)
          }
        }
      } else {
        return UIColor(red: 0, green: 0.431, blue: 0.9, alpha: 1)
      }
    }

    // additional colors
    @nonobjc public static var supernova: UIColor {
      if #available(iOS 13.0, *) {
        return UIColor { (traits: UITraitCollection) -> UIColor in
          switch traits.userInterfaceStyle {
          case .dark:
              return UIColor(red: 1, green: 0.839, blue: 0.039, alpha: 1)
          case .light, .unspecified:
              return UIColor(red: 1, green: 0.8, blue: 0, alpha: 1)
          @unknown default: // may have additional userInterfaceStyles in the future
              return UIColor(red: 1, green: 0.8, blue: 0, alpha: 1)
          }
        }
      } else {
        return UIColor(red: 1, green: 0.8, blue: 0, alpha: 1)
      }
    }

    // colored stub
    @nonobjc public static var mandysPink: UIColor {
      UIColor(red: 0.94, green: 0.7, blue: 0.67, alpha: 1)
    }
    @nonobjc public static var halfBaked: UIColor {
      UIColor(red: 0.55, green: 0.74, blue: 0.85, alpha: 1)
    }
    @nonobjc public static var mossGreen: UIColor {
      UIColor(red: 0.72, green: 0.87, blue: 0.69, alpha: 1)
    }
    @nonobjc public static var peachYellow: UIColor {
      UIColor(red: 0.98, green: 0.85, blue: 0.69, alpha: 1)
    }
    @nonobjc public static var saharaSand: UIColor {
      UIColor(red: 0.96, green: 0.92, blue: 0.57, alpha: 1)
    }
    @nonobjc public static var frenchLilac: UIColor {
      UIColor(red: 0.87, green: 0.75, blue: 0.92, alpha: 1)
    }
    @nonobjc public static var classicRose: UIColor {
      UIColor(red: 0.98, green: 0.78, blue: 0.9, alpha: 1)
    }
    @nonobjc public static var cornflower: UIColor {
      UIColor(red: 0.56, green: 0.87, blue: 0.92, alpha: 1)
    }
    @nonobjc public static var magicMint: UIColor {
      UIColor(red: 0.7, green: 0.95, blue: 0.82, alpha: 1)
    }
    @nonobjc public static var iron: UIColor {
      UIColor(red: 0.89, green: 0.89, blue: 0.9, alpha: 1)
    }
  }
}
