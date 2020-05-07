//
//  ShimmeringView+Style.swift
//  EsoftUIKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Atlas
import Foundation
import ShimmerUI

extension ShimmeringView {
  public enum Styles {
    public static let `default` = Style(name: "shimmer.default") { (item: ShimmeringView) in
      item.isShimmering = true
      item.shimmerPauseDuration = 2
    }
  }
}

/*
public final class ListHeaderSkeletonCell: UICollectionViewCell {
  private(set) var titleStub: UIView = UIView()
  private(set) var titleStubShimmerView: ShimmeringView = ShimmeringView()
  
  override public init(frame: CGRect = .zero) {
    super.init(frame: frame)
    
    titleStub.setStyles(
      UIView.Styles.stubTitleBackground,
      UIView.Styles.cornerRadiusTiny
    )
    
    titleStubShimmerView.contentView = titleStub
    titleStubShimmerView.setStyles(ShimmeringView.Styles.default)
    
    contentView.addSubview(titleStubShimmerView)
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
      layout.height = YGValue.large
      layout.paddingHorizontal = YGValue.small
      layout.paddingVertical = YGValue.tiny
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
}
*/
