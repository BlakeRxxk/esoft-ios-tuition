//
//  AuthCityView+LayoutController.swift
//  AppLibrary
//
//  Created by nedstar on 25.05.2020.
//

import YogaKit

extension AuthCityView {
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
