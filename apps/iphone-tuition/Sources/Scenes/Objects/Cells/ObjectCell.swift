//
//  ObjectCell.swift
//  AppLibrary
//
//  Created by Алексей Макаров on 08.05.2020.
//

import Foundation
import EsoftUIKit
import YogaKit

public final class ObjectCell: UICollectionViewCell {
  
  private static let reuseIdentifier: String = "ObjectCellID"
  
  // MARK: - UI
  
  private(set) lazy var container: UIView = UIView()
  private(set) lazy var previewItemViewYOGA: PreviewItemViewYOGA = PreviewItemViewYOGA()
  
  // MARK: - Init
  
  override init(frame: CGRect = .zero) {
    super.init(frame: frame)
    
    createUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Functions
  
  override public func prepareForReuse() {
    super.prepareForReuse()
    
    previewItemViewYOGA.address = ""
    previewItemViewYOGA.currentPrice = ""
    previewItemViewYOGA.oldPrice = ""
    previewItemViewYOGA.photos = []
    previewItemViewYOGA.objectsDescription = ""
    previewItemViewYOGA.views = ""
    previewItemViewYOGA.favorites = ""
    previewItemViewYOGA.code = ""
  }
  
  private func createUI() {
    container.addSubview(previewItemViewYOGA)
    contentView.addSubview(container)
  }
  
  override public func layoutSubviews() {
    super.layoutSubviews()
    
    container.backgroundColor = .orange
    
    container.configureLayout { layout in
      layout.isEnabled = true
      layout.flexDirection = .column
      layout.width = YGValue(UIScreen.main.bounds.width)
      layout.marginTop = YGValue(8)
      layout.paddingLeft = 16
      layout.paddingRight = 16
    }
    
    contentView.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 100%
    }
    
    previewItemViewYOGA.configureLayout { (layout) in
      layout.isEnabled = true
    }
    
    contentView.yoga.applyLayout(preservingOrigin: true)
  }
  
}
