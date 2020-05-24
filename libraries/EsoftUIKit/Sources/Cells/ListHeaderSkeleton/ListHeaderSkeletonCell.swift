//
//  ListHeaderSkeletonCell.swift
//  EsoftUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import UIKit
import YogaKit
import ShimmerUI

public final class ListHeaderSkeletonCell: UICollectionViewCell {
  private(set) var titleStub: UIView = UIView()
  private(set) var titleStubShimmerView: ShimmeringView = ShimmeringView()
  
  override public init(frame: CGRect = .zero) {
    super.init(frame: frame)
    
    createUI()
    configureUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override public func layoutSubviews() {
    super.layoutSubviews()
    
    let container = bounds.size
    contentView.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 48
      layout.paddingHorizontal = 16
      layout.paddingVertical = 8
      layout.alignItems = .flexEnd
      layout.justifyContent = .flexStart
      layout.flexDirection = .row
    }
    
    titleStubShimmerView.configureLayout { layout in
      layout.isEnabled = true
      layout.width = YGValue(container.width * 0.4)
      layout.height = YGValue(17)
    }
    
    contentView.yoga.applyLayout(preservingOrigin: true)
  }
  
  private func createUI() {
    contentView.addSubview(titleStubShimmerView)
  }
  
  private func configureUI() {
    titleStub.setStyles(
      UIView.Styles.stubTitleBackground,
      UIView.Styles.cornerRadiusTiny
    )
    
    titleStubShimmerView.contentView = titleStub
    titleStubShimmerView.setStyles(ShimmeringView.Styles.default)
  }
}
