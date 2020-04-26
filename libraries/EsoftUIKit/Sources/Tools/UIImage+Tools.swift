//
//  UIImage+Tools.swift
//  EsoftUIKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import CoreGraphics
import UIKit

extension Bundle {
  class Class {}
  
  static var framework: Bundle {
    Bundle(for: Class.self)
  }
}

extension UIImage {
  // resource loader
  static func named(_ name: String) -> UIImage {
    guard let image = UIImage(named: name, in: Bundle.framework, compatibleWith: nil) else {
      assertionFailure("Image '\(name)' not found")
      return UIImage()
    }
    return image
  }
}
