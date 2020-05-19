//
//  SpecialistView+Layout.swift
//  ESUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import YogaKit

extension LoginViewController {
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
    
    let phoneTextFieldContainer: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.height = 64
      layout.marginTop = 70
    }
    
    let phoneTextField: YGLayoutConfigurationBlock = { layout in
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
    
    let socialStackContainer: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.height = 32
      layout.marginTop = 52
    }
    
    let socialStack: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 100%
      layout.paddingHorizontal = 51
    }
    
    let termLabel: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.marginTop = 16
    }
  }
}
