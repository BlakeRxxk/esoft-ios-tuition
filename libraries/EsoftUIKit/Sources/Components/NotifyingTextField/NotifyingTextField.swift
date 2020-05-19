//
//  SocialStack.swift
//  AppLibrary
//
//  Created by nedstar on 24.04.2020.
//

import Atlas
import UIKit
import EsoftUIKit
import ThemeManager
import YogaKit
import BaseUI
import PhoneNumberFormat

// Переработать
public final class NotifyingTextField: View {
  public var placeholder: String {
    get {
      formattedTextField!.placeholder
    }
    set {
      formattedTextField!.placeholder = newValue
    }
  }
  
  private(set) lazy var textFieldConatainer: UIView = UIView()
  private(set) var formattedTextField: FormattedTextField?
  private(set) lazy var showTextButton: UIButton = UIButton()
  private(set) lazy var divider: UIView = UIView()
  private(set) lazy var messageLabel: UILabel = UILabel()
  
  public weak var output: NotifyingTextFieldOutput?
  
  public init(type: FormattedTextFieldType) {
    super.init()
    
    formattedTextField = FormattedTextFieldBuilder().build(type)
    createUI(type)
    configureUI(type)
  }
  
  private func createUI(_ type: FormattedTextFieldType) {
    textFieldConatainer.addSubview(formattedTextField!)
    if type == .password {
      textFieldConatainer.addSubview(showTextButton)
    }
    
    [
      textFieldConatainer,
      divider,
      messageLabel
      ].forEach { addSubview($0) }
  }
  
  private func configureUI(_ type: FormattedTextFieldType) {
    formattedTextField!.output = self
    
    showTextButton.setImage(UIImage.eye, for: .normal)
    showTextButton.imageView?.tintColor = ThemeManager.current().textColors.secondary
    showTextButton.addTarget(self, action: #selector(didTouchshowTextButton), for: .touchUpInside)
    
    divider.backgroundColor = ThemeManager.current().colors.divider
    
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
    
    textFieldConatainer.configureLayout(block: { layout in
      layout.isEnabled = true
      layout.height = YGValue(containerSize.height - 23)
      layout.flexDirection = .row
    })
    
    formattedTextField!.configureLayout(block: { layout in
      layout.isEnabled = true
      layout.width = 1
      layout.flexGrow = 1
    })
    showTextButton.configureLayout(block: { layout in
      layout.isEnabled = true
      layout.width = 22
      layout.height = 15
      layout.marginTop = 3
      layout.marginLeft = 9
    })
    divider.configureLayout(block: {layout in
      layout.isEnabled = true
      layout.height = 1
    })
    messageLabel.configureLayout(block: { layout in
      layout.isEnabled = true
      layout.height = 18
      layout.marginTop = 4
    })
    
    yoga.applyLayout(preservingOrigin: true)
  }
  
  private func getMessage(by color: UIColor) -> String? {
    guard divider.backgroundColor == color else { return nil }
    return messageLabel.text
  }
  
  private func setMessage(message: String, color: UIColor) {
    divider.backgroundColor = color
    messageLabel.styledText = message
    self.setNeedsLayout() // как то по-другому?
  }
  
  private func clearMessage() {
    divider.backgroundColor = ThemeManager.current().colors.divider
    messageLabel.styledText = nil
  }
  
  @objc func didTouchshowTextButton() {
    formattedTextField!.isSecureTextEntry = !formattedTextField!.isSecureTextEntry
  }
}

extension NotifyingTextField: FormattedTextFieldOutput {
  public func valueDidChange(sender: FormattedTextField, newVal: String) {
    output?.valueDidChange(sender: self, newVal: newVal)
  }
}

extension NotifyingTextField: NotifyingTextFieldInput {
  public var errorMessage: String? {
    get {
      getMessage(by: ThemeManager.current().colors.error)
    }
    set {
      if let message = newValue {
        setMessage(message: message, color: ThemeManager.current().colors.error)
      } else {
        clearMessage()
      }
    }
  }
}
