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
      layout.alignItems = .center
      layout.justifyContent = .flexStart
    }
    
    let enterLabel: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.marginTop = 44
    }
    
    let phoneTextField: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.paddingHorizontal = YGValue.small
      layout.marginTop = 70
    }
    
    let divider: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 1
      layout.paddingHorizontal = YGValue.small
      layout.marginTop = 21.5
    }
    
    let continueButton: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 44
      layout.paddingHorizontal = YGValue.small
      layout.marginTop = 48
    }
    
    let socialStackView: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 32
      layout.paddingHorizontal = 51
      layout.marginTop = 52
    }
    
    let socialIcon: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = 32
      layout.height = 32
    }
    
    let termLabel: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.marginTop = YGValue(16)
    }
  }
}

extension YGValue {
  public static let small: YGValue = 32
}
