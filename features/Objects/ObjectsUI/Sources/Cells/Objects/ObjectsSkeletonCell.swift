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
  
  override init(frame: CGRect = .zero) {
    super.init(frame: frame)
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
