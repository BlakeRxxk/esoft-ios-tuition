//
//  UnauthorizedListCell.swift
//  EsoftUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import UIKit
import YogaKit

public final class UnauthorizedListCell: UICollectionViewCell {
  private static let reuseIdentifier: String? = "UnauthorizedListCell"
  private(set) lazy var stubView: EmptyListView = {
    $0.output = self
    return $0
  }(EmptyListView())
  weak var output: UnauthorizedListCellOutput?
  
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
    stubView.actionButtonMode = .default
  }
  
  private func createUI() {
    contentView.addSubview(stubView)
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
}

extension UnauthorizedListCell: UnauthorizedListCellInput {}

extension UnauthorizedListCell: EmptyListOutput {
  public func didTapActionButton(in stubView: EmptyListInput) {
    output?.didTapActionButton(in: self)
  }
}
