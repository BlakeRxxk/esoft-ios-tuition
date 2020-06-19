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

public final class ObjectsSkeletonCell: UICollectionViewCell {
  
  private static let reuseIdentifier: String = "ObjectsSkeletonCellID"
  
  private(set) var previewViewSkeleton: PreviewViewSkeleton = PreviewViewSkeleton()
  
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
      previewViewSkeleton
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
    
    previewViewSkeleton.configureLayout { layout in
      layout.isEnabled = true
      layout.width = YGValue(container.width)
      layout.height = YGValue(container.height)
    }
    
    contentView.yoga.applyLayout(preservingOrigin: true)
  }
  
}
