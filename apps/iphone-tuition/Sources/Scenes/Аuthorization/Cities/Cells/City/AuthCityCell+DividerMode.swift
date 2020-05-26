//
//  AuthCityCell+DividerMode.swift
//  AppLibrary
//
//  Created by nedstar on 26.05.2020.
//

import Foundation

extension AuthCityCell {
  func updateDivider() {
    if lastCell {
      hideDivider()
    } else {
      showDivider()
    }
  }
  
  func showDivider() {
    layoutController.show(divider,
                          in: self,
                          with: layout.divider)
  }
  
  func hideDivider() {
    layoutController.hide(divider)
  }
}
