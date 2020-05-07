//
//  Ingredient.swift
//  AnimateUI
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import UIKit

open class Ingredient: Equatable {
  
  internal enum Kind {
    case bezier, spring
  }
  
  /**
   Changes the opacity of the layer.
   */
  open var alpha: CGFloat {
    didSet { alpha(alpha) }
  }
  
  /**
   Changes the x position in the anchor point (0, 0).
   */
  open var x: CGFloat {
    didSet { x(x) }
  }
  
  /**
   Changes the y position in the anchor point (0, 0).
   */
  open var y: CGFloat {
    didSet { y(y) }
  }
  
  /**
   Changes the width of the layer.
   */
  open var width: CGFloat {
    didSet { width(width) }
  }
  
  /**
   Changes the height of the layer.
   */
  open var height: CGFloat {
    didSet { height(height) }
  }
  
  /**
   Changes the origin of the view in the anchor point (0, 0)
   */
  open var origin: CGPoint {
    didSet { origin(origin.x, origin.y) }
  }
  
  /**
   Changes the size of the view.
   */
  open var size: CGSize {
    didSet { size(size.width, size.height) }
  }
  
  /**
   Changes the frame of the view.
   */
  open var frame: CGRect {
    didSet { frame(frame.origin.x, frame.origin.y, frame.width, frame.height) }
  }
  
  /**
   Changes the cornerRadius of the layer.
   */
  open var radius: CGFloat {
    didSet { radius(radius) }
  }
  
  /**
   Apply a transform value, can be any `CGAffineTransform`.
   */
  open var transform: CGAffineTransform {
    didSet { transform(transform) }
  }
  
  /**
   Apply a transform value, can be any `CATransform3D`.
   */
  open var transform3D: CATransform3D {
    didSet { transform3D(transform3D) }
  }
  
  internal let view: UIView
  internal let duration: TimeInterval
  internal let curve: Animation.Curve
  internal let kind: Kind
  internal let calculation: Animation.Spring
  internal let spring: SpringOptions
  internal let options: [Animation.Options]
  var animations: [CAKeyframeAnimation] = []
  var properties: [Animation.Property] = []
  var finalValues: [NSValue] = []
  var springs: [SpringOptions] = []
  var distillery: Distillery
  
  init(distillery: Distillery,
       view: UIView,
       duration: TimeInterval,
       curve: Animation.Curve,
       options: [Animation.Options]) {
    
    self.distillery = distillery
    self.view = view
    self.duration = duration
    self.curve = curve
    self.kind = .bezier
    self.calculation = .spring
    self.options = options
    self.spring = SpringOptions(spring: .zero, friction: .zero, mass: .zero, tolerance: .zero)
    self.alpha = view.alpha
    self.x = view.frame.origin.x
    self.y = view.frame.origin.y
    self.width = view.frame.width
    self.height = view.frame.height
    self.origin = view.frame.origin
    self.size = view.frame.size
    self.frame = view.frame
    self.radius = view.layer.cornerRadius
    self.transform = view.transform
    self.transform3D = view.layer.transform
  }
  
  init(distillery: Distillery,
       view: UIView,
       spring: CGFloat,
       friction: CGFloat,
       mass: CGFloat,
       tolerance: CGFloat,
       calculation: Animation.Spring,
       options: [Animation.Options] = []) {
    
    self.distillery = distillery
    self.view = view
    self.duration = 0
    self.curve = .linear
    self.kind = .spring
    self.calculation = calculation
    self.options = options
    self.spring = SpringOptions(spring: spring, friction: friction, mass: mass, tolerance: tolerance)
    self.alpha = view.alpha
    self.x = view.frame.origin.x
    self.y = view.frame.origin.y
    self.width = view.frame.width
    self.height = view.frame.height
    self.origin = view.frame.origin
    self.size = view.frame.size
    self.frame = view.frame
    self.radius = view.layer.cornerRadius
    self.transform = view.transform
    self.transform3D = view.layer.transform
  }
  
  /**
   Changes the opacity of the layer.
   */
  open func alpha(_ value: CGFloat) {
    animate(.opacity, value as NSValue)
  }
  
  /**
   Changes the x position in the anchor point (0, 0).
   */
  open func x(_ value: CGFloat) {
    animate(.positionX, value + view.frame.width / 2 as NSValue)
  }
  
  /**
   Changes the y position in the anchor point (0, 0).
   */
  open func y(_ value: CGFloat) {
    animate(.positionY, value + view.frame.height / 2 as NSValue)
  }
  
  /**
   Changes the width of the layer.
   */
  open func width(_ value: CGFloat) {
    animate(.width, value as NSValue)
    animate(.positionX, view.frame.origin.x + value / 2 as NSValue)
  }
  
  /**
   Changes the height of the layer.
   */
  open func height(_ value: CGFloat) {
    animate(.height, value as NSValue)
    animate(.positionY, view.frame.origin.y + value / 2 as NSValue)
  }
  
  /**
   Changes the origin of the view in the anchor point (0, 0)
   */
  open func origin(_ x: CGFloat, _ y: CGFloat) {
    animate(.origin, NSValue(cgPoint: CGPoint(x: x + view.frame.width / 2, y: y + view.frame.height / 2)))
  }
  
  /**
   Changes the size of the view.
   */
  open func size(_ width: CGFloat, _ height: CGFloat) {
    animate(.size, NSValue(cgSize: CGSize(width: width, height: height)))
    animate(.origin, NSValue(cgPoint: CGPoint(x: view.frame.origin.x + width / 2, y: view.frame.origin.y + height / 2)))
  }
  
  /**
   Changes the frame of the view.
   */
  open func frame(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) {
    animate(.size, NSValue(cgSize: CGSize(width: width, height: height)))
    animate(.origin, NSValue(cgPoint: CGPoint(x: x + width / 2, y: y + height / 2)))
  }
  
  /**
   Changes the cornerRadius of the layer.
   */
  open func radius(_ value: CGFloat) {
    animate(.cornerRadius, value as NSValue)
  }
  
  /**
   Apply a transform value, can be any `CGAffineTransform`.
   */
  open func transform(_ value: CGAffineTransform) {
    animate(.transform, NSValue(caTransform3D: CATransform3DMakeAffineTransform(value)))
  }
  
  /**
   Apply a transform value, can be any `CATransform3D`.
   */
  open func transform3D(_ value: CATransform3D) {
    animate(.transform, NSValue(caTransform3D: value))
  }
  
  func animate(_ property: Animation.Property, _ value: NSValue) {
    var animation = CAKeyframeAnimation()
    
    if kind == .bezier {
      animation = Distill.bezier(property, bezierPoints: Animation.points(curve), duration: duration, options: options)
      animation.values = [value]
      animation.delegate = distillery
    } else {
      animation = Distill.spring(property, type: .spring)
      animation.delegate = distillery
    }
    
    animations.append(animation)
    properties.append(property)
    finalValues.append(value)
    springs.append(spring)
  }
}

public func == (lhs: Ingredient, rhs: Ingredient) -> Bool {
  lhs.view == rhs.view && lhs.properties == rhs.properties && lhs.finalValues == rhs.finalValues
}
