//
//  Still.swift
//  AnimateUI
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import UIKit

/**
 Distill performs all the animations added by the tuple.
 
 - Parameter sets: A touple with multiple animations and final values.
 - Parameter view: The view you want to apply the animation to.
 - Parameter key: An optional key to put in the animation.
 */
public func distill(_ sets: (animation: CAKeyframeAnimation, final: NSValue)..., view: UIView, key: String? = nil) {
  
  for set in sets {
    guard let keyPath = set.animation.keyPath, let property = Animation.Property(rawValue: keyPath),
      let presentedLayer = view.layer.presentation() else { break }
    
    if set.animation.timingFunction != nil {
      set.animation.values = [Animation.propertyValue(property, layer: presentedLayer), set.final]
    }
    
    // TODO: Implement reusable springs.
    
    view.layer.add(set.animation, forKey: key)
  }
}

var stills: [Still] = []

public struct Still {
  
  /**
   Defines and returns an animation with some parameters.
   
   - Parameter property: The Animation.Property that you want to animate.
   - Parameter curve: The animation curve you want it to be, cannot be Spring.
   - Parameter duration: The duration of the animation, defaults to 0.5.
   - Parameter options: A set of options that can be .Reverse or .Repeat().
   
   - Returns: A CAKeyframeAnimation you can modify.
   */
  @discardableResult public static func bezier(_ property: Animation.Property,
                                               curve: Animation.Curve = .linear,
                                               duration: TimeInterval = 0.5,
                                               options: [Animation.Options] = []) -> CAKeyframeAnimation {
    
    Distill.bezier(property,
                   bezierPoints: Animation.points(curve), duration: duration, options: options)
  }
}
