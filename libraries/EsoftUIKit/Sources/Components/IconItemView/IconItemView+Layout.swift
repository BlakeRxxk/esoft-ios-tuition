//
//  IconItemView+Layout.swift
//  EsoftUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import YogaKit

extension IconItemView {
  class Layout {
    let container: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.flexDirection = .row
      layout.alignItems = .center
      layout.justifyContent = .center
      layout.height = YGValue.large
      layout.paddingHorizontal = YGValue.small
    }
    
    let title: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.flexBasis = YGValueAuto
      layout.flexGrow = 1
      layout.flexShrink = 1
    }
    
    let iconRight: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = YGValue.base
      layout.height = YGValue.base
      layout.alignItems = .center
      layout.justifyContent = .center
//      layout.marginLeft = YGValue.small
    }
    
    let iconLeft: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = YGValue.base
      layout.height = YGValue.base
      layout.alignItems = .center
      layout.marginRight = YGValue(Space.small * 2)
      layout.justifyContent = .center
    }
    
    let topDivider: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.position = .absolute
      layout.top = YGValueZero
      layout.left = YGValue.small
      layout.right = YGValue.small
    }
    
    let bottomDivider: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.position = .absolute
      layout.bottom = YGValueZero
      layout.left = YGValue.small
      layout.right = YGValue.small
    }
  }
}
