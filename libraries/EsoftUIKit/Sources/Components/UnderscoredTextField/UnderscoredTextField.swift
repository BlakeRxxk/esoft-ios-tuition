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
  public var isSecureTextEntry: Bool {
    get {
      formattedTextField.isSecureTextEntry
    }
    set {
      formattedTextField.isSecureTextEntry = newValue
      
      if isSecureTextEntry {
        showTextButton.setImage(UIImage.eye, for: .normal)
      } else {
        showTextButton.setImage(UIImage.eyeSolid, for: .normal)
      }

    }
  }
  public var errorMessage: String? {
    didSet {
      // Цвета стоит заменить на rx?
      if errorMessage == nil {
        divider.backgroundColor = ThemeManager.current().colors.divider
      } else {
        divider.backgroundColor = ThemeManager.current().colors.error
        errorLabel.styledText = errorMessage // заменить на rx
      }
      self.setNeedsLayout() // как то по-другому?
    }
  }
  
  private(set) lazy var textFieldConatainer: UIView = UIView()
  private(set) lazy var formattedTextField: FormattedTextField = FormattedTextField()
  private(set) lazy var showTextButton: UIButton = UIButton()
  private(set) lazy var divider: UIView = UIView()
  private(set) lazy var errorLabel: UILabel = UILabel()
  
  public weak var output: UnderscoredTextFieldOutput?
  private var layoutController: LayoutController = LayoutController()
  
  public init(type: UnderscoredTextFieldType) {
    super.init()
    
    createUI(type)
    configureUI(type)
  }
  
  private func createUI(_ type: UnderscoredTextFieldType) {
    textFieldConatainer.addSubview(formattedTextField)
    if type == .password {
      textFieldConatainer.addSubview(showTextButton)
    }
    
    [
      textFieldConatainer,
      divider
      ].forEach { addSubview($0) }
  }
  
  private func configureUI(_ type: UnderscoredTextFieldType) {
    switch type {
      
    // Сделать билдер?
    case .password:
      formattedTextField.isSecureTextEntry = true
    case .phone:
      formattedTextField.keyboardType = .numberPad
      formattedTextField.formatter = formatPhoneNumber
    }
    formattedTextField.output = self
    
    showTextButton.setImage(UIImage.eye, for: .normal)
    showTextButton.imageView?.tintColor = ThemeManager.current().textColors.secondary
    showTextButton.addTarget(self, action: #selector(didTouchshowTextButton), for: .touchUpInside)
    
    divider.backgroundColor = ThemeManager.current().colors.divider
    
    errorLabel.setStyles(UILabel.Styles.singleLine,
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
    
    formattedTextField.configureLayout(block: { layout in
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
    
    // Как-то по-другому можно сделать это?
    if errorMessage == nil {
      layoutController.hide(errorLabel)
    } else {
      layoutController.show(errorLabel, in: self, with: { layout in
        layout.isEnabled = true
        layout.height = 18
        layout.marginTop = 4
      })
    }
    
    yoga.applyLayout(preservingOrigin: true)
  }
  
  @objc func didTouchshowTextButton() {
    self.isSecureTextEntry = !self.isSecureTextEntry
  }
}

extension UnderscoredTextField: FormattedTextFieldOutput {
  public func valueDidChange(sender: FormattedTextField, newVal: String) {
    output?.valueDidChange(sender: self, newVal: newVal)
  }
}

extension UnderscoredTextField: FormattedTextFieldInput {
}
