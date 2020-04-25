//
//  DiscountViewController+Layout.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import YogaKit
import EsoftUIKit

extension DiscountViewController {
  final class Layout {
    let imageContainer: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 40%
      layout.justifyContent = .flexStart
    }

    let bodyContainer: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.justifyContent = .flexStart
      layout.paddingHorizontal = YGValue(Space.small)
    }

    let imageViewWithGradient: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 100%
      layout.justifyContent = .flexStart
    }

    let arrowBackImageView: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = YGValue(25)
      layout.height = YGValue(25)
      layout.alignSelf = .flexStart
      layout.position = .absolute
      layout.left = YGValue(14)
      layout.top = 20%
    }

    let favouritesImageView: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = YGValue(25)
      layout.height = YGValue(25)
      layout.alignSelf = .flexEnd
      layout.position = .absolute
      layout.right = YGValue(48)
      layout.top = 20%
    }

    let shareImageView: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = YGValue(25)
      layout.height = YGValue(25)
      layout.alignSelf = .flexEnd
      layout.position = .absolute
      layout.right = YGValue(18)
      layout.top = 20%
    }

    let companyName: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.marginTop = YGValue(12)
    }

    let categoryLabel: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.marginTop = YGValue(2)
    }

    let discountType: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.marginTop = YGValue(Space.base)
    }

    let discountDescription: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.marginTop = YGValue(8)
    }

    let divider: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.height = YGValue(1)
      layout.marginTop = YGValue(8)
    }

    let whyYouCanUseDescription: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.marginTop = YGValue(8)
    }

    let button: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.height = YGValue(44)
      layout.marginTop = YGValue(Space.small)
    }
  }
}
