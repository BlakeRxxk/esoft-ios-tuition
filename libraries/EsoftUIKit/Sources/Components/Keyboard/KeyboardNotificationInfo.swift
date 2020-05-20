//
//  KeyboardNotificationInfo.swift
//  ESUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import UIKit

public class KeyboardNotificationInfo: NSObject {
  
  // The starting frame rectangle of the keyboard in screen coordinates
  public let beginKeyboardFrame: CGRect
  
  // The ending frame rectangle of the keyboard in screen coordinates
  public let endKeyboardFrame: CGRect
  
  // UIViewAnimationCurve constant that defines how the keyboard will be animated onto or off the screen
  public let animationCurve: UIView.AnimationCurve?
  
  // Identifies the duration of the animation in seconds
  public let animationDuration: TimeInterval?
  
  public init(beginKeyboardFrame: CGRect,
              endKeyboardFrame: CGRect,
              animationCurve: UIView.AnimationCurve?,
              animationDuration: TimeInterval?) {
    self.beginKeyboardFrame = beginKeyboardFrame
    self.endKeyboardFrame = endKeyboardFrame
    self.animationCurve = animationCurve
    self.animationDuration = animationDuration
    super.init()
  }
}
