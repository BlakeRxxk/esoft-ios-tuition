//
//  Avatar+Layout.swift
//  ESUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import YogaKit

extension Avatar {
  final class Layout {
    private(set) lazy var container: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = YGValue.large
      layout.height = YGValue.large
      layout.alignItems = .center
      layout.justifyContent = .center
    }
    
    private(set) lazy var avatarView: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = YGValue.large
      layout.height = YGValue.large
    }
    
    private(set) lazy var initialsContainer: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = YGValue.large
      layout.height = YGValue.large
      layout.position = .absolute
      layout.top = YGValueZero
      layout.bottom = YGValueZero
      layout.left = YGValueZero
      layout.right = YGValueZero
    }
    
    private(set) lazy var initialsLabel: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = YGValue.large
      layout.height = YGValue.large
    }
  }
}
