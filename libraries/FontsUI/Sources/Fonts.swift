//
//  Fonts.swift
//  FontsUI
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import UIKit

extension UIFont {
  public static var title1: UIFont {
    UIFont.makeFont(size: 34, face: "Bold")
  }
  
  public static var title2: UIFont {
    UIFont.makeFont(size: 28, face: "Regular")
  }
  
  public static var title3: UIFont {
    UIFont.makeFont(size: 20, face: "Semibold")
  }

  public static var regular: UIFont {
    UIFont.makeFont(size: 17, face: "Regular")
  }

  public static var regularSemibold: UIFont {
    UIFont.makeFont(size: 17, face: "Semibold")
  }
  
  public static var small: UIFont {
    UIFont.makeFont(size: 15, face: "Regular")
  }
  
  public static var smallSemibold: UIFont {
    UIFont.makeFont(size: 15, face: "Semibold")
  }
  
  public static var tiny: UIFont {
    UIFont.makeFont(size: 13, face: "Regular")
  }
  
  public static var micro: UIFont {
    UIFont.makeFont(size: 10, face: "Medium")
  }
  
  private static func makeFont(size: CGFloat, face: String) -> UIFont {
    var descriptor = UIFontDescriptor()
    let font = UIFont.systemFont(ofSize: size)
    descriptor = descriptor.withFamily(font.familyName)
    descriptor = descriptor.withSize(CGFloat(size))
    descriptor = descriptor.withFace(face)
    return UIFont(descriptor: descriptor, size: 0)
  }
}

// MARK: - Kern sizes
extension UIFont {
  enum Kern {
    static let s = 0.4
    static let m = 0.8
    static let l = 1.2
  }
}
