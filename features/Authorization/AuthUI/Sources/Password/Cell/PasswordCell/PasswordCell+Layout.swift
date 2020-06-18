//
//  PasswordCell+Layout.swift
//  AuthUI#iphonesimulator-x86_64
//
//  Created by nedstar on 18.06.2020.
//

import YogaKit

extension PasswordCell {
  final class Layout {
    let container: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.flexDirection = .column
      layout.justifyContent = .flexStart
    }
    
    let enterLabel: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.marginTop = 44
    }
    
    let passwordTextFieldContainer: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.height = 64
      layout.marginTop = 70
    }
    
    let passwordTextField: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 100%
      layout.paddingHorizontal = 32
    }
    
    let continueButton: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.height = 44
      layout.marginTop = 26
      layout.marginHorizontal = 32
    }
    
    let forgottenLabel: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.marginTop = 29
    }
  }
}
