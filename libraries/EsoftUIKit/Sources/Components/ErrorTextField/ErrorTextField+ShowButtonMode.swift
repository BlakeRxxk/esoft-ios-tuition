//
//  ErrorTextField+ShowButtonMode.swift
//  EsoftUIKit
//
//  Created by nedstar on 18.06.2020.
//

extension ErrorTextField {
  func updateShowButton() {
    if showButton {
      showShowButton()
    } else {
      hideShowButton()
    }
  }
  
  func showShowButton() {
    layoutController.show(showTextButton,
                          in: textFieldContainer,
                          with: layout.showTextButton)
  }
  
  func hideShowButton() {
    layoutController.hide(showTextButton)
  }
}
