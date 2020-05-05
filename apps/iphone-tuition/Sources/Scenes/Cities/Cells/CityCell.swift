//
//  CityCell.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import UIKit
import YogaKit

public final class CityCell: UICollectionViewCell {
  private static let reuseIdentifier: String = "CityCellID"
  
  private(set) lazy var title: UILabel = UILabel()
  
  override init(frame: CGRect = .zero) {
    super.init(frame: frame)
    
    createUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override public func prepareForReuse() {
    super.prepareForReuse()
    title.styledText = ""
  }
  
  private func createUI() {
    contentView.addSubview(title)
  }

  override public func layoutSubviews() {
    super.layoutSubviews()
    
    contentView.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = YGValue(48)
      layout.paddingHorizontal = YGValue(16)
    }
    
    title.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = YGValue(48)
    }
    
    contentView.yoga.applyLayout(preservingOrigin: true)
  }
}
