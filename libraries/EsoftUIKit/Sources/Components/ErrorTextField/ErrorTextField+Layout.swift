//
//  ErrorTextField+Layout.swift
//  EsoftUIKit
//
//  Created by nedstar on 18.06.2020.
//

import YogaKit

extension ErrorTextField {
  final class Layout {
    let textField: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = 1
      layout.height = 20
      layout.flexGrow = 1
    }
    
    let showTextButton: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = 22
      layout.height = 15
      layout.marginTop = 3
      layout.marginLeft = 9
    }
    
    let divider: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.height = 1
      layout.marginTop = 22
    }
    
    let messageLabel: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.height = 18
      layout.marginTop = 4
    }
  }
}
