//
//  DiscountCell+Layout.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import UIKit
import YogaKit
import EsoftUIKit

extension DiscountCell {
  final class Layout {
    static let imageContainer: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 50%
      layout.justifyContent = .flexStart
    }

    static let bodyContainer: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.justifyContent = .flexStart
      layout.paddingHorizontal = YGValue(Space.small)
    }

    static let imageViewWithGradient: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 100%
      layout.justifyContent = .flexStart
    }

    static let arrowBackButton: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = YGValue(Space.base)
      layout.height = YGValue(Space.base)
      layout.alignSelf = .flexStart
      layout.position = .absolute
      layout.left = YGValue(14)
      layout.top = YGValue(UIViewController.topbarHeight() - Space.base)
    }

    static let favouritesImageView: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = YGValue(Space.base)
      layout.height = YGValue(Space.base)
      layout.alignSelf = .flexEnd
      layout.position = .absolute
      layout.right = YGValue(48)
      layout.top = YGValue(UIViewController.topbarHeight() - Space.base)
    }

    static let shareImageView: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.width = YGValue(Space.base)
      layout.height = YGValue(Space.base)
      layout.alignSelf = .flexEnd
      layout.position = .absolute
      layout.right = YGValue(18)
      layout.top = YGValue(UIViewController.topbarHeight() - Space.base)
    }

    static let companyName: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.marginTop = YGValue(12)
    }

    static let categoryLabel: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.marginTop = YGValue(2)
    }

    static let discountType: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.marginTop = YGValue(Space.base)
    }

    static let discountDescription: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.marginTop = YGValue(8)
    }

    static let divider: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.height = YGValue(1)
      layout.marginTop = YGValue(8)
    }

    static let discountUseSpace: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.marginTop = YGValue(8)
    }

    static let button: YGLayoutConfigurationBlock = { layout in
      layout.isEnabled = true
      layout.height = YGValue(44)
      layout.marginTop = YGValue(Space.small)
    }
  }
}
