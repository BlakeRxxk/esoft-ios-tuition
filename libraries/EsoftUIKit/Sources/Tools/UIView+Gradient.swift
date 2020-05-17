//
//  UIView+Gradient.swift
//  EsoftUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import UIKit

extension UIView {
  public enum DirectionGradient {
    case horizontally
    case vertically
    case under45degreesLeftToRight
    case under45degreesRightToLeft

    var startPoint: CGPoint {
      switch self {
      case .horizontally, .vertically, .under45degreesLeftToRight:
        return CGPoint(x: 0.0, y: 0.0)
      case .under45degreesRightToLeft:
        return CGPoint(x: 1.0, y: 0.0)
      }
    }

    var endPoint: CGPoint {
      switch self {
      case .horizontally:
        return CGPoint(x: 1.0, y: 0.0)
      case .vertically:
        return CGPoint(x: 0.0, y: 1.0)
      case .under45degreesLeftToRight:
        return CGPoint(x: 1.0, y: 1.0)
      case .under45degreesRightToLeft:
        return CGPoint(x: 0.0, y: 1.0)
      }
    }
  }

  public func setGradient(colors: [UIColor],
                          direction: DirectionGradient = .horizontally,
                          locations: (Double, Double) = (0, 1),
                          size: CGSize) {
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame.size = size
    gradientLayer.colors = colors.map { $0.cgColor }
    gradientLayer.locations = [NSNumber(value: locations.0), NSNumber(value: locations.1)]
    gradientLayer.startPoint = direction.startPoint
    gradientLayer.endPoint = direction.endPoint
    layer.insertSublayer(gradientLayer, at: 0)
  }
}
