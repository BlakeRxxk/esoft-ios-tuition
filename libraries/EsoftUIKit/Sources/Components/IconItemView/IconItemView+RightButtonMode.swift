//
//  IconItemView+RightButtonMode.swift
//  EsoftUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation

extension IconItemView {
  public enum RightButtonMode {
    case never
    case visible
    public static let `default`: IconItemView.RightButtonMode = .never
  }
  
  func updateRightIcon() {
    switch rightIconMode {
    case .never:
      hideRightIcon()
    case .visible:
      showRightIcon()
    }
  }
  
  func showRightIcon() {
    layoutController.show(rightIconView,
                          in: self,
                          with: layout.iconRight)
  }
  
  func hideRightIcon() {
    layoutController.hide(rightIconView)
  }
}
