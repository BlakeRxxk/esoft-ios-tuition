//
//  SpecialistView+Layout.swift
//  ESUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import YogaKit

extension SocialStack {
  final class Layout {
    let container: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 100%
      layout.flexDirection = .row
      layout.justifyContent = .spaceBetween
    }
    
    let socialIcon: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = 32
      layout.height = 32
    }
  }
}
