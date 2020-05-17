//
//  SpecialistView+RightButtonMode.swift
//  EtagiClient
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation

extension SpecialistView {
  public enum RightButtonMode {
    case never
    case visible
    public static let `default`: SpecialistView.RightButtonMode = .never
  }
  
  func updateRightButton() {
    switch rightButtonMode {
    case .never:
      hideRightButton()
    case .visible:
      showRightButton()
    }
  }
  
  func showRightButton() {
    layoutController.show(iconView,
                          in: iconViewContainer,
                          with: layout.iconView)
  }
  
  func hideRightButton() {
    layoutController.hide(iconView)
  }
}
