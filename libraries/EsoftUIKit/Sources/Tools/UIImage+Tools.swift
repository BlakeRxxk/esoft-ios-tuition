//
//  UIImage+Tools.swift
//  EsoftUIKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import CoreGraphics
import UIKit

// MARK: - Extension for generating and changing image
extension UIImage {
  
  /// Generate image of color of {1, 1} size.
  ///
  /// - parameter color: color of new image
  ///
  /// - returns: generated image
  static func image(color: UIColor) -> UIImage {
    
    let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
    UIGraphicsBeginImageContext(rect.size)
    defer {
      UIGraphicsEndImageContext()
    }
    guard let context = UIGraphicsGetCurrentContext() else {
      assertionFailure("Can't get graphic context")
      return UIImage()
    }
    
    context.setFillColor(color.cgColor)
    context.fill(rect)
    
    guard let image = UIGraphicsGetImageFromCurrentImageContext() else {
      assertionFailure("Can't get image from context")
      return UIImage()
    }
    
    return image
  }
  
  /// Scale image to size.
  ///
  /// - parameter size: size for scaling
  ///
  /// - returns: new scaled image
  func scaled(to size: CGSize) -> UIImage {
    
    UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
    defer {
      UIGraphicsEndImageContext()
    }
    guard let context = UIGraphicsGetCurrentContext() else {
      assertionFailure("Can't get graphic context")
      return self
    }
    let rect = CGRect(origin: .zero, size: size)
    context.clear(rect)
    draw(in: rect)
    guard let image = UIGraphicsGetImageFromCurrentImageContext() else {
      assertionFailure("Can't get image from context")
      return self
    }
    return image
  }
  
  /// Round image with corner radius.
  ///
  /// - parameter cornerRadius: corner radius for rounding
  ///
  /// - returns: new rounded image image
  func rounded(cornerRadius: CGFloat) -> UIImage {
    
    UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
    defer {
      UIGraphicsEndImageContext()
    }
    guard let context = UIGraphicsGetCurrentContext() else {
      assertionFailure("Can't get graphic context")
      return self
    }
    
    let rect = CGRect(origin: .zero, size: size)
    context.addPath(UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).cgPath)
    context.clip()
    
    draw(in: rect)
    guard let image = UIGraphicsGetImageFromCurrentImageContext() else {
      assertionFailure("Can't get image from context")
      return self
    }
    
    return image
  }
  
  /// Render image from given view.
  ///
  /// - parameter cornerRadius: corner radius for rounding
  ///
  /// - returns: new rounded image image
  
  func imageWithView(_ view: UIView) -> UIImage {
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.isOpaque, UIScreen.main.scale)
    
    defer {
      UIGraphicsEndImageContext()
    }
    view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
    
    guard let image = UIGraphicsGetImageFromCurrentImageContext() else {
      assertionFailure("Can't get image from context")
      return self
    }
    return image
  }
}

// MARK: - Internal image tools
extension UIImage {
  
  /// Generate image with tint color
  ///
  /// - parameter color: color of new image
  ///
  /// - returns: generated image
  func colorizedImage(color: UIColor) -> UIImage {
    UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
    defer {
      UIGraphicsEndImageContext()
    }
    guard let context = UIGraphicsGetCurrentContext() else {
      assertionFailure("Can't get graphic context")
      return self
    }
    context.translateBy(x: 0, y: self.size.height)
    context.scaleBy(x: 1.0, y: -1.0)
    context.setBlendMode(CGBlendMode.normal)
    let rect = CGRect(origin: .zero, size: size)
    guard let cgImage = self.cgImage else {
      assertionFailure("Can't get cgimage")
      return self
    }
    context.clip(to: rect, mask: cgImage)
    color.setFill()
    context.fill(rect)
    guard let newImage = UIGraphicsGetImageFromCurrentImageContext() else {
      assertionFailure("Can't get image from context")
      return self
    }
    return newImage
  }
}

extension Bundle {
  final class Class {}
  
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
