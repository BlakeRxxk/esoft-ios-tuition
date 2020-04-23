//
//  Anchor.swift
//  AutoLayoutKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import UIKit.NSLayoutConstraint
import UIKit.UIView

public class XAxisAnchor: Anchor {}
public class YAxisAnchor: Anchor {}

public class Anchor {
  internal let view: Any
  internal let attribute: NSLayoutConstraint.Attribute
  
  internal init(view: Any, attribute: NSLayoutConstraint.Attribute) {
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
