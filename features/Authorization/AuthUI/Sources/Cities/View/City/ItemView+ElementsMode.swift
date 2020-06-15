//
//  AuthCityView+RegionsLabelMode.swift
//  AppLibrary
//
//  Created by nedstar on 25.05.2020.
//

import UIKit

extension ItemView {
  func updateTitleLabel() {
    if lockSignText != nil {
      titleLabel.setStyles(UILabel.ColorStyle.placeholders)
    }
    else {
      titleLabel.setStyles(UILabel.ColorStyle.primary)
    }
  }
}

extension ItemView {
  func updateSecondaryLabel() {
    if lockSignText == nil {
      showSecondaryLabel()
    } else {
      hideSecondaryLabel()
    }
  }
  
  func showSecondaryLabel() {
    layoutController.show(secondaryLabel,
                          in: leftContentView,
                          with: layout.secondaryLabel)
  }
  
  func hideSecondaryLabel() {
    layoutController.hide(secondaryLabel)
  }
}

extension ItemView {
  func updateLockSignLabel() {
    if lockSignText != nil {
      showLockSignLabel()
    } else {
      hideLockSignLabel()
    }
  }
  
  func showLockSignLabel() {
    layoutController.show(lockSignLabel,
                          in: self,
                          with: layout.lockSignLabel)
  }
  
  func hideLockSignLabel() {
    layoutController.hide(lockSignLabel)
  }
}

extension ItemView {
  func updateSelectedSign() {
    if isSelected {
      showSelectedSign()
    }
    else {
      hideSelectedSign()
    }
  }
  
  func showSelectedSign() {
    layoutController.show(chekMarkImageView,
                          in: self,
                          with: layout.chekMarkImageView)
  }
  
  func hideSelectedSign() {
    layoutController.hide(chekMarkImageView)
  }
}
