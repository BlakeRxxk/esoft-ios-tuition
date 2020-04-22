//
//  SampleComponent+Layout.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import YogaKit

extension SampleComponent {
  final class Layout {
    let container: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.height = YGValue(96)
      layout.width = 100%
      layout.flexDirection = .column
    }
    
    let titleLabel: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
    }
    
    let actionButton: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.height = 48
      layout.width = YGValueAuto
    }
    
    let resetButton: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.height = 48
      layout.width = YGValueAuto
    }
  }
}
