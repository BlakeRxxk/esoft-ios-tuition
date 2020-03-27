//
//  Anchor.swift
//  AutoLayoutKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import UIKit.NSLayoutConstraint
import UIKit.UIView

public class Anchor {
  fileprivate let view: Any
  fileprivate let attribute: NSLayoutConstraint.Attribute
  
  fileprivate init(view: Any, attribute: NSLayoutConstraint.Attribute) {
    self.view = view
    self.attribute = attribute
  }
  
  public func constraint(equalTo anchor: Anchor) -> NSLayoutConstraint {
    constraint(equalTo: anchor, constant: 0)
  }
  
  public func constraint(equalTo anchor: Anchor, constant: CGFloat) -> NSLayoutConstraint {
    NSLayoutConstraint(item: view,
                              attribute: attribute,
                              relatedBy: .equal,
                              toItem: anchor.view,
                              attribute: anchor.attribute,
                              multiplier: 1,
                              constant: constant)
  }
  
  public func constraint(greaterThanOrEqualTo anchor: Anchor) -> NSLayoutConstraint {
    constraint(greaterThanOrEqualTo: anchor, constant: 0)
  }
  
  public func constraint(greaterThanOrEqualTo anchor: Anchor, constant: CGFloat) -> NSLayoutConstraint {
    NSLayoutConstraint(item: view,
                              attribute: attribute,
                              relatedBy: .greaterThanOrEqual,
                              toItem: anchor.view,
                              attribute: anchor.attribute,
                              multiplier: 1,
                              constant: constant)
  }
  
  public func constraint(lessThanOrEqualTo anchor: Anchor) -> NSLayoutConstraint {
    constraint(lessThanOrEqualTo: anchor, constant: 0)
  }
  
  public func constraint(lessThanOrEqualTo anchor: Anchor, constant: CGFloat) -> NSLayoutConstraint {
    NSLayoutConstraint(item: view,
                              attribute: attribute,
                              relatedBy: .lessThanOrEqual,
                              toItem: anchor.view,
                              attribute: anchor.attribute,
                              multiplier: 1,
                              constant: constant)
  }
}

public class XAxisAnchor: Anchor {}
public class YAxisAnchor: Anchor {}

public class Dimension: Anchor {
  
  public func constraint(equalTo anchor: Dimension, multiplier: CGFloat) -> NSLayoutConstraint {
    constraint(equalTo: anchor, multiplier: multiplier, constant: 0)
  }
  
  public func constraint(equalTo anchor: Dimension, multiplier: CGFloat, constant: CGFloat) -> NSLayoutConstraint {
    NSLayoutConstraint(item: view,
                              attribute: attribute,
                              relatedBy: .equal,
                              toItem: anchor.view,
                              attribute: anchor.attribute,
                              multiplier: multiplier,
                              constant: constant)
  }
  
  public func constraint(equalToConstant constant: CGFloat) -> NSLayoutConstraint {
    NSLayoutConstraint(item: view,
                              attribute: attribute,
                              relatedBy: .equal,
                              toItem: nil,
                              attribute: .notAnAttribute,
                              multiplier: 1,
                              constant: constant)
  }
  
  public func constraint(greaterThanOrEqualTo anchor: Dimension, multiplier: CGFloat) -> NSLayoutConstraint {
    constraint(greaterThanOrEqualTo: anchor, multiplier: multiplier, constant: 0)
  }
  
  public func constraint(greaterThanOrEqualTo anchor: Dimension,
                         multiplier: CGFloat,
                         constant: CGFloat) -> NSLayoutConstraint {
    NSLayoutConstraint(item: view,
                              attribute: attribute,
                              relatedBy: .greaterThanOrEqual,
                              toItem: anchor.view,
                              attribute: anchor.attribute,
                              multiplier: multiplier,
                              constant: constant)
  }
  
  public func constraint(greaterThanOrEqualToConstant constant: CGFloat) -> NSLayoutConstraint {
    NSLayoutConstraint(item: view,
                              attribute: attribute,
                              relatedBy: .greaterThanOrEqual,
                              toItem: nil,
                              attribute: .notAnAttribute,
                              multiplier: 1,
                              constant: constant)
  }
  
  public func constraint(lessThanOrEqualTo anchor: Dimension, multiplier: CGFloat) -> NSLayoutConstraint {
    constraint(lessThanOrEqualTo: anchor, multiplier: multiplier, constant: 0)
  }
  
  public func constraint(lessThanOrEqualTo anchor: Dimension,
                         multiplier: CGFloat,
                         constant: CGFloat) -> NSLayoutConstraint {
    NSLayoutConstraint(item: view,
                              attribute: attribute,
                              relatedBy: .lessThanOrEqual,
                              toItem: anchor.view,
                              attribute: anchor.attribute,
                              multiplier: multiplier,
                              constant: constant)
  }
  
  public func constraint(lessThanOrEqualToConstant constant: CGFloat) -> NSLayoutConstraint {
    NSLayoutConstraint(item: view,
                              attribute: attribute,
                              relatedBy: .lessThanOrEqual,
                              toItem: nil,
                              attribute: .notAnAttribute,
                              multiplier: 1,
                              constant: constant)
  }
}

extension UIView {
  public var left: XAxisAnchor {
    XAxisAnchor(view: self, attribute: .left)
  }
  public var right: XAxisAnchor {
    XAxisAnchor(view: self, attribute: .right)
  }
  public var top: YAxisAnchor {
    YAxisAnchor(view: self, attribute: .top)
  }
  public var bottom: YAxisAnchor {
    YAxisAnchor(view: self, attribute: .bottom)
  }
  public var leading: XAxisAnchor {
    XAxisAnchor(view: self, attribute: .leading)
  }
  public var trailing: XAxisAnchor {
    XAxisAnchor(view: self, attribute: .trailing)
  }
  public var width: Dimension {
    Dimension(view: self, attribute: .width)
  }
  public var height: Dimension {
    Dimension(view: self, attribute: .height)
  }
  public var centerX: XAxisAnchor {
    XAxisAnchor(view: self, attribute: .centerX)
  }
  public var centerY: YAxisAnchor {
    YAxisAnchor(view: self, attribute: .centerY)
  }
  public var lastBaseline: YAxisAnchor {
    YAxisAnchor(view: self, attribute: .lastBaseline)
  }
  public var firstBaseline: YAxisAnchor {
    YAxisAnchor(view: self, attribute: .firstBaseline)
  }
  public var leftMargin: XAxisAnchor {
    XAxisAnchor(view: self, attribute: .leftMargin)
  }
  public var rightMargin: XAxisAnchor {
    XAxisAnchor(view: self, attribute: .rightMargin)
  }
  public var topMargin: YAxisAnchor {
    YAxisAnchor(view: self, attribute: .topMargin)
  }
  public var bottomMargin: YAxisAnchor {
    YAxisAnchor(view: self, attribute: .bottomMargin)
  }
  public var leadingMargin: XAxisAnchor {
    XAxisAnchor(view: self, attribute: .leadingMargin)
  }
  public var trailingMargin: XAxisAnchor {
    XAxisAnchor(view: self, attribute: .trailingMargin)
  }
  public var centerXWithinMargins: XAxisAnchor {
    XAxisAnchor(view: self, attribute: .centerXWithinMargins)
  }
  public var centerYWithinMargins: YAxisAnchor {
    YAxisAnchor(view: self, attribute: .centerYWithinMargins)
  }
}

extension UILayoutSupport {
  public var top: YAxisAnchor {
    YAxisAnchor(view: self, attribute: .top)
  }
  public var bottom: YAxisAnchor {
    YAxisAnchor(view: self, attribute: .bottom)
  }
  public var height: Dimension {
    Dimension(view: self, attribute: .height)
  }
}
