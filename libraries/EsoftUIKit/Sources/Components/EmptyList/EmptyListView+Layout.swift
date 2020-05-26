//
//  EmptyListView+Layout.swift
//  EsoftUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import YogaKit

extension EmptyListView {
  final class Layout {
    let container: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 100%
      layout.flexDirection = .column
      layout.alignItems = .center
      layout.justifyContent = .spaceAround
      layout.padding = YGValue.small
    }
    
    let stubContainer: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = YGValueAuto
      layout.alignItems = .center
      layout.justifyContent = .center
      layout.paddingHorizontal = YGValue.tiny
    }
    
    let stubImage: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = YGValue.large
      layout.height = YGValue.large
      layout.marginBottom = YGValue.base
    }
    
    let stubTitle: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.marginBottom = YGValue.tiny
    }
    
    let stubMessage: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = 100%
    }
    
    let stubActionButton: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.position = .absolute
      layout.left = YGValue.small
      layout.right = YGValue.small
      layout.bottom = YGValue.small
    }
    
    let adjustedActionButton: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.position = .absolute
      layout.left = YGValue.small
      layout.right = YGValue.small
      layout.bottom = YGValue(Space.small * 2)
    }
  }
}
