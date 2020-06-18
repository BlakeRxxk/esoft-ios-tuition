//
//  IconItemView+LayoutController.swift
//  ESUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import YogaKit
import UIKit

extension IconItemView {
  class LayoutController {
    func show(_ view: UIView,
              in parent: UIView,
              with layout: @escaping YGLayoutConfigurationBlock,
              first: Bool = false) {
      
      guard view.superview == nil else { return }
      
      if first {
        parent.insertSubview(view, at: 0)
      } else {
        parent.addSubview(view)
      }
      
      view.configureLayout(block: layout)
    }
    
    func hide(_ view: UIView) {
      view.removeFromSuperview()
    }
  }
}
