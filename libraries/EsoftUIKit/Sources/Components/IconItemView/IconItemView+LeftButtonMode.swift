//
//  IconItemView+LeftButtonMode.swift
//  EsoftUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation

extension IconItemView {
  public enum LeftButtonMode {
    case never
    case visible
    public static let `default`: IconItemView.LeftButtonMode = .never
  }
  
  func updateLeftIcon() {
    switch leftIconMode {
    case .never:
      hideLeftIcon()
    case .visible:
      showLeftIcon()
    }
  }
  
  func showLeftIcon() {
    
    layoutController.show(leftIconView,
                          in: self,
                          with: layout.iconLeft,
                          first: true)
  }
  
  func hideLeftIcon() {
    layoutController.hide(leftIconView)
  }
}
