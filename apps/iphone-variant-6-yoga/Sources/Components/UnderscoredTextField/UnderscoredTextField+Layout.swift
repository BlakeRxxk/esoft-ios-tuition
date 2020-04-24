//
//  SpecialistView+Layout.swift
//  ESUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import YogaKit

extension UnderScoredTextField {
  final class Layout {
    let container: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
    }
    
    let socialIcon: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = 32
      layout.height = 32
    }
  }
}
