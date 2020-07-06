//
//  EditDescriptionCell.swift
//  SellerTicketUI#iphonesimulator-x86_64
//
//  Created by wtildestar on 25/06/2020.
//

import UIKit
import YogaKit
import Atlas
import BaseFRP
import EsoftUIKit

public final class EditDescriptionCell: UICollectionViewCell {
  private static let reuseIdentifier: String = "EditDescriptionCellID"
  
  public weak var output: EditDescriptionCellOutput?
  
  public private(set) lazy var descTextView: UITextView = UITextView()
  private(set) lazy var sendButton: UIButton = UIButton()
  
  override init(frame: CGRect = .zero) {
    super.init(frame: frame)
    
    createUI()
    configureUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    subviews.forEach {
      $0.yoga.markDirty()
    }
    yoga.applyLayout(preservingOrigin: true)
    super.traitCollectionDidChange(previousTraitCollection)
  }
  
  override public func layoutSubviews() {
    super.layoutSubviews()
    
    contentView.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 100% //YGValue(UIScreen.main.bounds.size.height)
    }
    
    descTextView.configureLayout { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 100%
    }
    
//    sendButton.configureLayout { layout in
//      layout.isEnabled = true
//      layout.marginHorizontal = 16
//      layout.position = .relative
//      layout.maxWidth = Int(91.47)%
//      layout.marginTop = Int(80)%
//    }
    
    contentView.yoga.applyLayout(preservingOrigin: true, dimensionFlexibility: .flexibleHeight)
  }
  
  private func createUI() {
    contentView.addSubview <^> [
      descTextView
    ]
    
  }
  
  private func configureUI() {
    sendButton.setStyledTitle(Localized.sendButtonTitle, for: .normal)
    sendButton.setStyles(UIButton.Styles.primary)
    contentView.backgroundColor = .red
  }
}

extension EditDescriptionCell: EditDescriptionCellInput {}

extension EditDescriptionCell {
  enum Localized {
    public static let sendButtonTitle = "Отправить"
  }
}
