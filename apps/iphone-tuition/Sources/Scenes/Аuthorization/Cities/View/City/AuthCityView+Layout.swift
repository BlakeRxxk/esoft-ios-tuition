//
//  AuthCityView+Layout.swift
//  AppLibrary
//
//  Created by nedstar on 25.05.2020.
//

import YogaKit

extension AuthCityView {
  final class Layout {
    let container: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 100%
      layout.flexDirection = .row
    }
    
    let leftContentView: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = 50%
      layout.flexGrow = 1
      layout.flexDirection = .column
    }
    
    let nameLabel: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.height = 22
    }
    
    let regionsLabel: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.flexGrow = 1
    }
    
    let comingSoonLabel: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = 57
      layout.height = 24
      layout.alignSelf = .center
    }
  }
}
