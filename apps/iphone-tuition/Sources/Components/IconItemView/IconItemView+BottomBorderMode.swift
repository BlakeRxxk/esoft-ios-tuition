//
//  IconItemView+BottomBorderMode.swift
//  ESUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation

extension IconItemView {
  public enum BottomBorderMode {
    case never
    case visible
    public static let `default`: IconItemView.BottomBorderMode = .never
  }
  
  func updateBottomBorder() {
    switch bottomBorderMode {
    case .never:
      hideBottomBorder()
    case .visible:
      showBottomBorder()
    }
  }
  
  func showBottomBorder() {
    layoutController.show(bottomDivider,
                          in: self,
                          with: layout.bottomDivider)
  }
  
  func hideBottomBorder() {
    layoutController.hide(bottomDivider)
  }
}
