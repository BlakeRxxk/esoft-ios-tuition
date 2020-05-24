//
//  ListHeader+Layout.swift
//  EsoftUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import YogaKit

extension ListHeader {
  final class Layout {
    let container: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = YGValue.large
      layout.alignItems = .flexEnd
      layout.justifyContent = .flexStart
      layout.flexDirection = .row
    }
    
    let title: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.flexGrow = 1
      layout.marginHorizontal = YGValue.small
      layout.marginBottom = YGValue.tiny
    }
    
    let iconContainer: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = YGValue.large
      layout.height = YGValue.large
      layout.paddingRight = YGValue.small
      layout.paddingBottom = YGValue(6)
      layout.alignItems = .flexEnd
      layout.justifyContent = .flexEnd
      layout.flexDirection = .row
    }
    
    let iconImageView: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = YGValue.base
      layout.height = YGValue.base
    }
  }
}
