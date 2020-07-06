//
//  SellerTicketSkeletonCell.swift
//  AppLibrary
//
//  Created by wtildestar on 23/05/2020.
//

import Foundation
import YogaKit
import BaseFRP
import EsoftUIKit

public final class SellerTicketSkeletonCell: UICollectionViewCell {
  private static let reuseIdentifier: String = "SpecialistSkeletonCellID"
  
  private(set) var costItemViewStub: CostItemViewSkeleton = CostItemViewSkeleton()
  private(set) var photoItemViewStub: PhotoItemViewSkeleton = PhotoItemViewSkeleton()
  
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
      costItemViewStub,
      photoItemViewStub
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
    
    costItemViewStub.configureLayout { layout in
      layout.isEnabled = true
      layout.width = YGValue(container.width)
      layout.height = YGValue(container.height)
    }
    
    photoItemViewStub.configureLayout { layout in
      layout.isEnabled = true
      layout.width = YGValue(container.width)
      layout.height = YGValue(container.height)
    }
    
    contentView.yoga.applyLayout(preservingOrigin: true)
  }
}
