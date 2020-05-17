//
//  IconItemViewSkeleton.swift
//  ESUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation
import YogaKit
import BaseUI
import ShimmerUI
import BaseFRP

public final class IconItemViewSkeleton: View {
  private(set) var rowStub: UIView = UIView()
  private(set) var rowShimmerView: ShimmeringView = ShimmeringView()

  override public init() {
    super.init()
    
    createUI()
    configureUI()
  }
  
  private func createUI() {

    addSubview <^> [
      rowShimmerView
    ]
  }
  
  private func configureUI() {
    rowStub.setStyles(
      UIView.Styles.stubBackground,
      UIView.Styles.cornerRadiusTiny
    )
    
    rowShimmerView.contentView = rowStub
    rowShimmerView.setStyles(ShimmeringView.Styles.default)

  }
  
  override public func layoutSubviews() {
    super.layoutSubviews()
    
    let container = bounds.size
    configureLayout { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.flexDirection = .row
      layout.alignItems = .center
      layout.justifyContent = .flexStart
      layout.height = YGValue.large
      layout.paddingHorizontal = YGValue.small
    }

    rowShimmerView.configureLayout { layout in
      layout.isEnabled = true
      layout.width = YGValue(container.width * 0.7)
      layout.height = YGValue(17)
    }

    yoga.applyLayout(preservingOrigin: true)
  }
}
