//
//  FormattedTextField+Layout.swift
//  EsoftUIKit#iphonesimulator-x86_64
//
//  Created by nedstar on 13.05.2020.
//

import YogaKit

extension FormattedTextField {
  final class Layout {
    let container: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 100%
      layout.flexDirection = .column
    }
    
    let textField: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
    }
  }
}
