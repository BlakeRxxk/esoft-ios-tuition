//
//  DistrictCell.swift
//  AppLibrary
//
//  Created by Blake Rxxk on 29.04.2020.
//

import UIKit
import YogaKit
import IGListKit
import EsoftUIKit

public final class DistrictCell: UICollectionViewCell {
  private static let reuseIdentifier: String = "DistrictCellID"
  
  private(set) lazy var title: UILabel = UILabel()
  
  override init(frame: CGRect = .zero) {
    super.init(frame: frame)
    
    createUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
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

  override public func prepareForReuse() {
    super.prepareForReuse()
    title.styledText = ""
  }
  
  private func createUI() {
    contentView.addSubview(title)
    title.setStyles(UILabel.Styles.title2)
  }
}

extension DistrictCell: ListBindable {
  public func bindViewModel(_ viewModel: Any) {
    guard let viewModel = viewModel as? DistrictsViewModel else { return }
    title.styledText = viewModel.name
    
    layoutSubviews()
  }
}
