//
//  ErrorTextField.swift
//  EsoftUIKit
//
//  Created by nedstar on 18.06.2020.
//

import Atlas
import UIKit
import EsoftUIKit
import ThemeManager
import YogaKit
import BaseUI
import PhoneNumberFormat

// Переработать
public final class ErrorTextField: View {
  public var errorMessage: String? {
    get {
      messageLabel.text
    }
    set {
      if let message = newValue {
        divider.setStyles(UIView.Styles.errorBackground)
      } else {
        divider.setStyles(UIView.Styles.divider)
      }
      messageLabel.styledText = newValue
      messageLabel.yoga.markDirty()
    }
  }
  public var showButton: Bool = true {
    didSet {
      updateShowButton()
      self.setNeedsLayout()
    }
  }
  
  private(set) lazy var textFieldContainer: UIView = UIView()
  public private(set) lazy var textField: UITextField = UITextField()
  private(set) lazy var showTextButton: UIButton = UIButton()
  private(set) lazy var divider: UIView = UIView()
  private(set) lazy var messageLabel: UILabel = UILabel()
  
  internal lazy var layoutController: LayoutController = LayoutController()
  internal lazy var layout: Layout = Layout()
  
  public override init() {
    super.init()
    
    createUI()
    configureUI()
  }
  
  private func createUI() {
    [
      textField,
      showTextButton
      ].forEach { textFieldContainer.addSubview($0) }
    
    [
      textFieldContainer,
      divider,
      messageLabel
      ].forEach { addSubview($0) }
  }
  
  private func configureUI() {
    // Сделать стиль
    showTextButton.setImage(UIImage.eye, for: .normal)
    showTextButton.imageView?.tintColor = ThemeManager.current().textColors.secondary
    showTextButton.addTarget(self, action: #selector(didTapShowTextButton), for: .touchUpInside)
    
    divider.setStyles(UIView.Styles.divider)
    
    messageLabel.setStyles(UILabel.Styles.singleLine,
                           UILabel.Styles.alignLeft,
                           UILabel.Styles.tiny,
                           UILabel.ColorStyle.error)
  }
  
  override public func layoutSubviews() {
    super.layoutSubviews()
    
    let containerSize = self.bounds.size
    self.configureLayout(block: { layout in
      layout.isEnabled = true
      layout.height = YGValue(containerSize.height)
      layout.width = YGValue(containerSize.width)
      layout.flexDirection = .column
    })
    
    textFieldContainer.configureLayout(block: { layout in
      layout.isEnabled = true
      layout.height = YGValue(containerSize.height - 23)
      layout.flexDirection = .row
    })
    
    textField.configureLayout(block: layout.textField)
    showTextButton.configureLayout(block: layout.showTextButton)
    divider.configureLayout(block: layout.divider)
    messageLabel.configureLayout(block: layout.messageLabel)
    
    yoga.applyLayout(preservingOrigin: true)
  }
  
  @objc func didTapShowTextButton() {
    textField.isSecureTextEntry = !textField.isSecureTextEntry
    if textField.isSecureTextEntry {
      showTextButton.setImage(UIImage.eyeSolid, for: .normal)
    } else {
      showTextButton.setImage(UIImage.eye, for: .normal)
    }
  }
}

extension ErrorTextField: ErrorTextFieldInput {}
