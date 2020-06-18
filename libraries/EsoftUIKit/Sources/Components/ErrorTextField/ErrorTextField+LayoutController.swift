//
//  ErrorTextField+LayoutController.swift
//  EsoftUIKit
//
//  Created by nedstar on 18.06.2020.
//

import YogaKit

extension ErrorTextField {
  final class LayoutController {
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
