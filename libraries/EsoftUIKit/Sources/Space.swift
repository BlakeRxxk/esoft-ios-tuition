//
//  Space.swift
//  EsoftUIKit
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import CoreGraphics
import YogaKit

public enum Space {
  public static let tiny: CGFloat = 8
  public static let small: CGFloat = 16
  public static let base: CGFloat = 24
  public static let large: CGFloat = 48
  public static let xLarge: CGFloat = 64
  public static let xxLarge: CGFloat = 128
}

extension YGValue {
  public static let tiny: YGValue = YGValue(Space.tiny)
  public static let small: YGValue = YGValue(Space.small)
  public static let base: YGValue = YGValue(Space.base)
  public static let large: YGValue = YGValue(Space.large)
  public static let xLarge: YGValue = YGValue(Space.xLarge)
  public static let xxLarge: YGValue = YGValue(Space.xxLarge)
}
