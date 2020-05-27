//
//  CityCell+DividerMode.swift
//  Authorization#iphonesimulator-x86_64
//
//  Created by nedstar on 27.05.2020.
//

import Foundation

extension CityCell {
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
