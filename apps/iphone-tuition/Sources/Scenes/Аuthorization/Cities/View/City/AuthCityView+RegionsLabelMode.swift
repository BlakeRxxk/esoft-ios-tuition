//
//  AuthCityView+RegionsLabelMode.swift
//  AppLibrary
//
//  Created by nedstar on 25.05.2020.
//

import Foundation

extension AuthCityView {
  func updateRegionsLabel() {
    if !isComingSoon {
      showRegionsLabel()
    } else {
      hideRegionsLabel()
    }
  }
  
  func showRegionsLabel() {
    layoutController.show(regionsLabel,
                          in: leftContentView,
                          with: layout.regionsLabel)
  }
  
  func hideRegionsLabel() {
    layoutController.hide(regionsLabel)
  }
}
