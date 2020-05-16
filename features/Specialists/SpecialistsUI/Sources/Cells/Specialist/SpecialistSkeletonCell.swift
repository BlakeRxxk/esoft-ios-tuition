//
//  SpecialistSkeletonCell.swift
//  ESUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation
import YogaKit
import BaseFRP
import EsoftUIKit

public final class SpecialistSkeletonCell: UICollectionViewCell {
  private static let reuseIdentifier: String = "SpecialistSkeletonCellID"
  
  private(set) var specialistViewStub: SpecialistViewSkeleton = SpecialistViewSkeleton()
  private(set) var phoneRowViewStub: IconItemViewSkeleton = IconItemViewSkeleton()
  private(set) var chatRowViewStub: IconItemViewSkeleton = IconItemViewSkeleton()
  
  override init(frame: CGRect = .zero) {
    super.init(frame: frame)
    
    createUI()
    configureUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func createUI() {
    contentView.addSubview <^> [
      specialistViewStub,
      phoneRowViewStub,
      chatRowViewStub
    ]
  }
  
  private func configureUI() {
    contentView.setStyles(UIView.Styles.whiteBackground)
  }

  override public func layoutSubviews() {
    super.layoutSubviews()
    
    let container = contentView.bounds.size
    contentView.configureLayout { layout in
      layout.isEnabled = true
      layout.width = YGValue(container.width)
      layout.height = YGValue(container.height)
      layout.flexDirection = .column
      layout.alignItems = .flexStart
    }
    
    specialistViewStub.configureLayout { layout in
      layout.isEnabled = true
      layout.width = YGValue(container.width)
      layout.height = YGValue(80)
    }
    
    phoneRowViewStub.configureLayout { layout in
      layout.isEnabled = true
      layout.width = YGValue(container.width * 0.8)
      layout.height = YGValue.large
    }
    
    chatRowViewStub.configureLayout { layout in
      layout.isEnabled = true
      layout.width = YGValue(container.width)
      layout.height = YGValue.large
    }
    
    contentView.yoga.applyLayout(preservingOrigin: true)
  }
}
