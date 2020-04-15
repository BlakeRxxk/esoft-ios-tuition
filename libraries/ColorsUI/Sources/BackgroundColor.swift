//
//  BackgroundColor.swift
//  ColorsUI
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import UIKit

extension UIColor {
  public struct BackgroundColor {
    @nonobjc public static var divider: UIColor {
      if #available(iOS 13.0, *) {
        return UIColor { (traits: UITraitCollection) -> UIColor in
          switch traits.userInterfaceStyle {
          case .dark:
            return UIColor(red: 1, green: 1, blue: 1, alpha: 0.12)
          case .light, .unspecified:
            return UIColor(red: 0, green: 0, blue: 0, alpha: 0.12)
          @unknown default:
            return UIColor(red: 0, green: 0, blue: 0, alpha: 0.12)
          }
        }
      } else {
        return UIColor(red: 0, green: 0, blue: 0, alpha: 0.12)
      }
    }
    
    @nonobjc public static var screen: UIColor {
      if #available(iOS 13.0, *) {
        return UIColor { (traits: UITraitCollection) -> UIColor in
          switch traits.userInterfaceStyle {
          case .dark:
            return UIColor(red: 0.216, green: 0.216, blue: 0.271, alpha: 1)
          case .light, .unspecified:
            return UIColor(red: 0.937, green: 0.937, blue: 0.957, alpha: 1)
          @unknown default:
            return UIColor(red: 0.937, green: 0.937, blue: 0.957, alpha: 1)
          }
        }
      } else {
        return UIColor(red: 0.937, green: 0.937, blue: 0.957, alpha: 1)
      }
    }
    
    @nonobjc public static var whiteBackground: UIColor {
      if #available(iOS 13.0, *) {
        return UIColor { (traits: UITraitCollection) -> UIColor in
          switch traits.userInterfaceStyle {
          case .dark:
            return UIColor(red: 0.239, green: 0.239, blue: 0.3, alpha: 1)
          case .light, .unspecified:
            return UIColor(white: 1, alpha: 1)
          @unknown default: // may have additional userInterfaceStyles in the future
            return UIColor(white: 1, alpha: 1)
          }
        }
      } else {
        return UIColor(white: 1, alpha: 1)
      }
    }
    
    @nonobjc public static var topBar: UIColor {
      if #available(iOS 13.0, *) {
        return UIColor { (traits: UITraitCollection) -> UIColor in
          switch traits.userInterfaceStyle {
          case .dark:
            return UIColor(red: 0.216, green: 0.216, blue: 0.271, alpha: 1)
          case .light, .unspecified:
            return UIColor(red: 0.976, green: 0.976, blue: 0.976, alpha: 1)
          @unknown default:
            return UIColor(red: 0.976, green: 0.976, blue: 0.976, alpha: 1)
          }
        }
      } else {
        return UIColor(red: 0.976, green: 0.976, blue: 0.976, alpha: 1)
      }
    }
    
    @nonobjc public static var defaultTopBar: UIColor {
      if #available(iOS 13.0, *) {
        return UIColor { (traits: UITraitCollection) -> UIColor in
          switch traits.userInterfaceStyle {
          case .dark:
            return UIColor(red: 0.216, green: 0.216, blue: 0.271, alpha: 1)
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
    
    @nonobjc public static var stub: UIColor {
      if #available(iOS 13.0, *) {
        return UIColor { (traits: UITraitCollection) -> UIColor in
          switch traits.userInterfaceStyle {
          case .dark:
            return UIColor(red: 0.216, green: 0.216, blue: 0.271, alpha: 1)
          case .light, .unspecified:
            return UIColor(red: 0.929, green: 0.929, blue: 0.929, alpha: 1)
          @unknown default:
            return UIColor(red: 0.929, green: 0.929, blue: 0.929, alpha: 1)
          }
        }
      } else {
        return UIColor(red: 0.929, green: 0.929, blue: 0.929, alpha: 1)
      }
    }
    
    @nonobjc public static var overlay: UIColor {
      if #available(iOS 13.0, *) {
        return UIColor { (traits: UITraitCollection) -> UIColor in
          switch traits.userInterfaceStyle {
          case .dark:
            return UIColor(red: 0, green: 0, blue: 0, alpha: 0.48)
          case .light, .unspecified:
            return UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
          @unknown default:
            return UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
          }
        }
      } else {
        return UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
      }
    }
    
    @nonobjc public static var fabHighlighted: UIColor {
      UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)
    }
    
    @nonobjc public static var icon: UIColor {
      if #available(iOS 13.0, *) {
        return UIColor { (traits: UITraitCollection) -> UIColor in
          switch traits.userInterfaceStyle {
          case .dark:
            return UIColor(red: 0.81, green: 0.81, blue: 0.879, alpha: 0.4)
          case .light, .unspecified:
            return UIColor(red: 0.016, green: 0.016, blue: 0.059, alpha: 0.4)
          @unknown default:
            return UIColor(red: 0.016, green: 0.016, blue: 0.059, alpha: 0.4)
          }
        }
      } else {
        return UIColor(red: 0.016, green: 0.016, blue: 0.059, alpha: 0.4)
      }
    }
  }
}
