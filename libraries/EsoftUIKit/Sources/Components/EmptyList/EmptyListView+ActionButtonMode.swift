//
//  EmptyListView+ActionButtonMode.swift
//  EsoftUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import UIKit

extension EmptyListView {
  public enum ActionButtonMode {
    case never
    case show
    public static let `default`: EmptyListView.ActionButtonMode = .never
  }
  
  func updateActionButton() {
    switch actionButtonMode {
    case .never:
      hideActionButton()
    case .show:
      showActionButton()
    }
  }
  
  func hideActionButton() {
    layoutController.hide(stubActionButton)
  }
  
  func showActionButton() {
    var buttonLayout = layout.stubActionButton
    
    if !UIScreen.safeAreaInsets.bottom.isZero && adjustSafeArea {
      buttonLayout = layout.adjustedActionButton
    }
    
    layoutController.show(stubActionButton, in: self, with: buttonLayout)
  }
}
