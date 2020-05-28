//
//  MessageCell.swift
//  Authorization#iphonesimulator-x86_64
//
//  Created by nedstar on 27.05.2020.
//

import UIKit
import YogaKit
import EsoftUIKit

public final class MessageCell: UICollectionViewCell {
  private static let reuseIdentifier: String = "MessageCellID"
  
  public var message: String {
      get {
        messageLabel.text ?? ""
      }
      set {
        messageLabel.styledText = newValue
      }
    }
  
  private(set) lazy var messageLabel: UILabel = UILabel()
  
  public weak var output: LocationCellOutput?
  
  override init(frame: CGRect = .zero) {
    super.init(frame: frame)
    
    createUI()
    configureUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
//  override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
//    subviews.forEach {
//      $0.yoga.markDirty()
//    }
//    yoga.applyLayout(preservingOrigin: true)
//    super.traitCollectionDidChange(previousTraitCollection)
//  }
  
  override public func layoutSubviews() {
    super.layoutSubviews()
    
    let container = contentView.bounds.size
    contentView.configureLayout { layout in
      layout.isEnabled = true
      layout.width = YGValue(container.width)
      layout.height = YGValue(container.height)
    }
    
    messageLabel.configureLayout(block: { layout in
      layout.isEnabled = true
      layout.width = YGValue(container.width - 32)
      layout.alignSelf = .center
      layout.flexGrow = 1
    })
    
    contentView.yoga.applyLayout(preservingOrigin: true, dimensionFlexibility: .flexibleHeight)
  }
  
  private func createUI() {
    [
      messageLabel
      ].forEach { contentView.addSubview($0) }
  }
  
  private func configureUI() {
    messageLabel.setStyles(
      UILabel.Styles.tiny,
      UILabel.ColorStyle.placeholders,
      UILabel.Styles.alignCenter,
      UILabel.Styles.multiline
    )
  }
}

extension MessageCell: MessageCellInput {}
