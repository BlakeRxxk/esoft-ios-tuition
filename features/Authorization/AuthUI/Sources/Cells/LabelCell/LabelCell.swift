//
//  LabelCell.swift
//  AuthUI#iphonesimulator-x86_64
//
//  Created by nedstar on 19.06.2020.
//

import UIKit
import YogaKit
import EsoftUIKit

public final class LabelCell: UICollectionViewCell {
  private static let reuseIdentifier: String = "LabelCellID"
  
  public var text: String? {
    get {
      label.text
    }
    set {
      label.styledText = newValue
      label.yoga.markDirty()
    }
  }
  
  public private(set) lazy var label: UILabel = UILabel()
  
  override init(frame: CGRect = .zero) {
    super.init(frame: frame)
    
    createUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override public func prepareForReuse() {
    super.prepareForReuse()
    
//    text = nil
  }
  
  private func createUI() {
    contentView.addSubview(label)
  }
  
  public func build(_ builder: (UILabel) -> Void) {
    builder(label)
    label.yoga.markDirty()
  }
  
  override public func layoutSubviews() {
    super.layoutSubviews()
    
    let containerSize = contentView.bounds.size
    contentView.configureLayout(block: { layout in
      layout.isEnabled = true
      layout.height = YGValue(containerSize.height)
      layout.width = YGValue(containerSize.width)
    })
    
    label.configureLayout(block: { layout in
      layout.isEnabled = true
    })
    
    contentView.yoga.applyLayout(preservingOrigin: true)
  }
}

extension LabelCell: LabelCellInput {}
