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
  
  private(set) lazy var descTextView: UITextView = UITextView()
  private(set) lazy var sendButton: UIButton = UIButton()
  private(set) lazy var testView: UIView = UIView()
  
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
    
    testView.configureLayout { layout in
      layout.isEnabled = true
      layout.position = .absolute
      layout.top = 0
      layout.width = 100%
      layout.height = 200
    }
    
//    descTextView.configureLayout { layout in
//      layout.isEnabled = true
//      layout.marginTop = 8
//      layout.height = 200
//      layout.position = .relative
//    }
//
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
      testView
//      descTextView,
//      sendButton
    ]
    
  }
  
  private func configureUI() {
    sendButton.setStyledTitle(Localized.sendButtonTitle, for: .normal)
    sendButton.setStyles(UIButton.Styles.primary)
    contentView.backgroundColor = .red
    testView.backgroundColor = .yellow
  }
}

extension EditDescriptionCell: EditDescriptionCellInput {}

extension EditDescriptionCell {
  enum Localized {
    public static let sendButtonTitle = "Отправить"
  }
}
