//
//  SpecialistView+Layout.swift
//  ESUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import YogaKit

extension UnderscoredTextField {
  final class Layout {
    let container: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.flexDirection = .column
      layout.alignItems = .stretch
    }
    
    let phoneTextField: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
    }
    
    let divider: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.height = 1
      layout.marginTop = 21.5
    }
  }
}
