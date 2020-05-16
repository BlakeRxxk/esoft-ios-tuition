//
//  SpecialistView+Layout.swift
//  EsoftUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import YogaKit

extension SpecialistView {
  final class Layout {
    let container: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 100%
      layout.flexDirection = .column
    }
    
    let specialistsContainer: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = YGValue(80)
      layout.flexDirection = .row
      layout.alignItems = .center
      layout.paddingHorizontal = YGValue.small
      layout.paddingVertical = YGValue.tiny
    }
    
    let avatarView: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = YGValue.large
      layout.height = YGValue.large
      layout.marginRight = YGValue.tiny
    }
    
    let iconViewContainer: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = YGValue(40)
      layout.height = YGValueAuto
      layout.alignItems = .flexEnd
      layout.justifyContent = .center
    }
    
    let iconView: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = YGValue.base
      layout.height = YGValue.base
    }
    
    let nameContainer: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = YGValueAuto
      layout.flexDirection = .column
      layout.justifyContent = .center
      layout.flexShrink = 1
    }
    
    let fullNameLabel: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.maxHeight = YGValue(44)
      layout.height = YGValueAuto
    }
    
    let positionLabel: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = 100%
    }
  }
}
