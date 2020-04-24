//
//  SpecialistView+Layout.swift
//  ESUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import YogaKit

extension ViewController {
  final class Layout {
    let container: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.flexDirection = .column
      layout.alignItems = .stretch
      layout.justifyContent = .flexStart
    }
    
    let enterLabel: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.marginTop = 44
    }
    
    let phoneTextField: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.paddingHorizontal = 32
      layout.marginTop = 70
    }
    
    let continueButton: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.height = 44
      layout.marginHorizontal = 32
      layout.marginTop = 48
    }
    
    let socialStack: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.marginTop = 52
      layout.paddingHorizontal = 51
    }
    
    let termLabel: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.marginTop = 16
    }
  }
}
