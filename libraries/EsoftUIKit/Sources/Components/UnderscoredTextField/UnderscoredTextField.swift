//
//  SocialStack.swift
//  AppLibrary
//
//  Created by nedstar on 24.04.2020.
//

import UIKit
import YogaKit
import ThemeManager
import BaseUI
import PhoneNumberFormat

public enum UnderscoredTextFieldType {
  case phone
  case password
}

public final class UnderscoredTextField: View {
  public var placeholder: String {
    get {
      formattedTextField.placeholder
    }
    set {
      formattedTextField.placeholder = newValue
    }
  }
  
  private(set) lazy var formattedTextField: FormattedTextField = FormattedTextField()
  private(set) lazy var divider: UIView = UIView()
  
  public weak var output: UnderscoredTextFieldOutput?
  
  public init(type: UnderscoredTextFieldType) {
    super.init()
    
    createUI(type)
    configureUI(type)
  }
  
  private func createUI(_ type: UnderscoredTextFieldType) {
    [
      formattedTextField,
      divider
      ].forEach { addSubview($0) }
  }
  
  private func configureUI(_ type: UnderscoredTextFieldType) {
    switch type {
    case .password:
      formattedTextField.isSecureTextEntry = true
    case .phone:
      formattedTextField.keyboardType = .numberPad
      formattedTextField.formatter = formatPhoneNumber
    }
    formattedTextField.output = self
    
    divider.backgroundColor = ThemeManager.current().colors.divider
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
    
    formattedTextField.configureLayout(block: { layout in
      layout.isEnabled = true
      layout.height = YGValue(containerSize.height - 1)
    })
    divider.configureLayout(block: {layout in
      layout.isEnabled = true
      layout.height = 1
    })
    
    yoga.applyLayout(preservingOrigin: true)
  }
}

extension UnderscoredTextField: FormattedTextFieldOutput {
  public func valueDidChange(sender: FormattedTextField, newVal: String) {
    output?.valueDidChange(sender: self, newVal: newVal)
  }
}
