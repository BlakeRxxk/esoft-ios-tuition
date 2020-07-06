//
//  PhotoItemViewSkeleton.swift
//  EsoftUIKit
//
//  Created by wtildestar on 06/06/2020.
//

import YogaKit
import ShimmerUI
import BaseFRP
import BaseUI

public final class PhotoItemViewSkeleton: View {
  private(set) lazy var specialistsContainer: UIView = UIView()
  private(set) lazy var nameContainer: UIView = UIView()
  
  private(set) var familyNameStub: UIView = UIView()
  private(set) var familyNameShimmerView: ShimmeringView = ShimmeringView()
  
  private(set) var specialistNameStub: UIView = UIView()
  private(set) var nameShimmerView: ShimmeringView = ShimmeringView()
  
  private(set) var positionStub: UIView = UIView()
  private(set) var positionShimmerView: ShimmeringView = ShimmeringView()
  
  private(set) var avatarStub: UIView = UIView()
  private(set) var avatarShimmerView: ShimmeringView = ShimmeringView()
  
  override public init() {
    super.init()
    
    createUI()
    configureUI()
  }
  
  override public func layoutSubviews() {
    super.layoutSubviews()
    
    let container = bounds.size
    configureLayout { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 100%
      layout.flexDirection = .column
    }
    
    specialistsContainer.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = YGValue(80)
      layout.flexDirection = .row
      layout.paddingHorizontal = YGValue.small
      layout.paddingVertical = YGValue.tiny
    }
    
    nameContainer.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = YGValue(80)
      layout.flexDirection = .column
      layout.flexShrink = 1
    }
    
    familyNameShimmerView.configureLayout { layout in
      layout.isEnabled = true
      layout.width = YGValue(container.width * 0.7)
      layout.height = YGValue(17)
      layout.marginBottom = YGValue(6)
    }
    
    nameShimmerView.configureLayout { layout in
      layout.isEnabled = true
      layout.width = YGValue(container.width * 0.5)
      layout.height = YGValue(17)
      layout.marginBottom = YGValue(6)
    }
    
    positionShimmerView.configureLayout { layout in
      layout.isEnabled = true
      layout.width = YGValue(container.width * 0.6)
      layout.height = YGValue(15)
      layout.marginBottom = YGValue(6)
    }
    
    avatarShimmerView.configureLayout { layout in
      layout.isEnabled = true
      layout.width = YGValue.large
      layout.height = YGValue.large
      layout.marginRight = YGValue.tiny
    }
    
    yoga.applyLayout(preservingOrigin: true)
  }
  
  private func createUI() {
    nameContainer.addSubview <^> [
      familyNameShimmerView,
      nameShimmerView,
      positionShimmerView
    ]
    
    specialistsContainer.addSubview <^> [
      avatarShimmerView,
      nameContainer
    ]
    
    addSubview <^> [
      specialistsContainer
    ]
  }
  
  private func configureUI() {
    specialistNameStub.setStyles(
      UIView.Styles.stubBackground,
      UIView.Styles.cornerRadiusTiny
    )
    
    familyNameStub.setStyles(
      UIView.Styles.stubBackground,
      UIView.Styles.cornerRadiusTiny
    )
    
    positionStub.setStyles(
      UIView.Styles.stubBackground,
      UIView.Styles.cornerRadiusTiny
    )
    
    avatarStub.setStyles(
      UIView.Styles.stubBackground,
      UIView.Styles.avatar
    )
    
    familyNameShimmerView.contentView = familyNameStub
    familyNameShimmerView.setStyles(ShimmeringView.Styles.default)
    
    nameShimmerView.contentView = specialistNameStub
    nameShimmerView.setStyles(ShimmeringView.Styles.default)
    
    positionShimmerView.contentView = positionStub
    positionShimmerView.setStyles(ShimmeringView.Styles.default)
    
    avatarShimmerView.contentView = avatarStub
    avatarShimmerView.setStyles(ShimmeringView.Styles.default)
  }
}
