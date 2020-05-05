//
//  RootViewItemCell.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import UIKit
import YogaKit

public final class RootViewItemCell: UICollectionViewCell {
  private static let reuseIdentifier: String = "RootViewItemCellID"
  
  public var name: String {
    get {
      title.styledText ?? ""
    }
    set {
      title.styledText = newValue
      title.yoga.markDirty()
    }
  }
  
  private(set) lazy var title: UILabel = UILabel()
  
  public weak var output: RootViewItemOutput?
  
  override init(frame: CGRect = .zero) {
    super.init(frame: frame)
    
    createUI()
    configureUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override public func prepareForReuse() {
    super.prepareForReuse()
    title.styledText = ""
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
  
  @objc private func handleTapAction() {
    output?.didTapRow(in: self)
  }
  
  private func createUI() {
    contentView.addSubview(title)
  }
  
  private func configureUI() {
    let action = UITapGestureRecognizer(target: self, action: #selector(handleTapAction) )
    addGestureRecognizer(action)
  }
}

extension RootViewItemCell: RootViewItemInput {}
