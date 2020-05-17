//
//  IconItemView+TopBorderMode.swift
//  ESUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation

extension IconItemView {
  public enum TopBorderMode {
    case never
    case visible
    public static let `default`: IconItemView.TopBorderMode = .never
  }
  
  func updateTopBorder() {
    switch topBorderMode {
    case .never:
      hideTopBorder()
    case .visible:
      showTopBorder()
    }
  }
  
  func showTopBorder() {

    layoutController.show(topDivider,
                          in: self,
                          with: layout.topDivider)
    layoutIfNeeded()
  }
  
  func hideTopBorder() {
    layoutController.hide(topDivider)
  }
}
