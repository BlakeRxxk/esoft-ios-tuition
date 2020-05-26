//
//  AuthCityView+ComingSoonLabelMode.swift
//  AppLibrary
//
//  Created by nedstar on 25.05.2020.
//

import Foundation

extension AuthCityView {
  func updateComingSoonLabel() {
    if isComingSoon {
      showComingSoonLabel()
    } else {
      hideComingSoonLabel()
    }
  }
  
  func showComingSoonLabel() {
    layoutController.show(comingSoonLabel,
                          in: self,
                          with: layout.comingSoonLabel)
  }
  
  func hideComingSoonLabel() {
    layoutController.hide(comingSoonLabel)
  }
}
