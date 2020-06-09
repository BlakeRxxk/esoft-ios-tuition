//
//  ListHeaderCell.swift
//  EsoftUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import UIKit
import YogaKit

public final class ListHeaderCell: UICollectionViewCell {
  public var headerTitle: String {
    set {
      headerView.title.styledText = newValue
      headerView.title.yoga.markDirty()
    }
    get {
      headerView.title.styledText ?? ""
    }
  }
  
  public var iconImage: UIImage? {
    set {
      headerView.iconImage = newValue
      headerView.title.yoga.markDirty()
    }
    get {
      headerView.iconImage
    }
  }
  
  public weak var output: ListHeaderCellOutput?
  private(set) lazy var headerView: ListHeader = {
    $0.output = self
    return $0
  }(ListHeader())
  
  override init(frame: CGRect = .zero) {
    super.init(frame: frame)
    
    contentView.addSubview(headerView)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override public func layoutSubviews() {
    super.layoutSubviews()
    
    contentView.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 48
    }
    
    headerView.configureLayout { layout in
      layout.isEnabled = true
    }
    
    contentView.yoga.applyLayout(preservingOrigin: true)
  }
}

extension ListHeaderCell: ListHeaderCellInput {}

extension ListHeaderCell: ListHeaderViewOutput {
  public func didTapAction(in headerView: ListHeaderViewInput) {
    output?.didTapAction(in: self)
  }
}
