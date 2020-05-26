//
//  AuthCityCell+Layout.swift
//  AppLibrary
//
//  Created by nedstar on 26.05.2020.
//

import YogaKit

extension AuthCityCell {
  final class Layout {
    let container: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 100%
      layout.flexDirection = .column
    }
    
    let cityContainer: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.marginHorizontal = 16
      layout.marginTop = 13
      layout.marginBottom = 2
    }
    
    let cityView: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 100%
    }
    
    let divider: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 1
    }
  }
}
