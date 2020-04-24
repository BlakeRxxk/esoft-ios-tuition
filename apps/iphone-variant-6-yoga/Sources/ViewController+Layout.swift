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
      layout.height = 100%
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
      layout.marginHorizontal = 32
      layout.marginTop = 70
    }
    
    let divider: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.height = 1
      layout.marginHorizontal = 32
      layout.marginTop = 21.5
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
      layout.width = 100%
    }
    
    let termLabel: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.marginTop = YGValue(16)
    }
  }
}
