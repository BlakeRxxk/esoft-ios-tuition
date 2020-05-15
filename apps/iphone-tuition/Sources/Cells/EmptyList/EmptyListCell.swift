//
//  EmptyListCell.swift
//  ESUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import UIKit
import YogaKit
import BaseFRP

public final class EmptyListCell: UICollectionViewCell {
  private static let reuseIdentifier: String? = "EmptyListCellID"
  private(set) lazy var stubView: EmptyListView = EmptyListView()
  
  override init(frame: CGRect = .zero) {
    super.init(frame: frame)
    
    createUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override public func prepareForReuse() {
    super.prepareForReuse()
    stubView.title = ""
    stubView.message = ""
    stubView.image = UIImage()
    stubView.actionTitle = ""
    stubView.actionButtonMode = .never
  }
  
  private func createUI() {
    contentView.addSubview <^> [
      stubView
    ]
  }
  
  override public func layoutSubviews() {
    super.layoutSubviews()
    contentView.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 100%
    }
    
    stubView.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 100%
    }
    contentView.yoga.applyLayout(preservingOrigin: true)
  }

  override public func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
    setNeedsLayout()
    layoutIfNeeded()
    
    let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
    var newFrame = layoutAttributes.frame
    newFrame.size.height = ceil(size.height)
    layoutAttributes.frame = newFrame
    
    return layoutAttributes
  }
}

extension EmptyListCell {
  func bindViewModel(model: EmptyListViewModel) {
    stubView.title = model.title
    stubView.message = model.message
    stubView.image = model.image
    stubView.actionButtonMode = .never
  }
}
