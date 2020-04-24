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

public final class UnderscoredTextField : View {
  public var placeholder: String {
    get {
      return phoneTextField.placeholder ?? ""
    }
    set {
      phoneTextField.placeholder = newValue
    }
  }
  
  private(set) lazy var container: UIView = UIView()
  private(set) lazy var phoneTextField: UITextField = {
    $0.addTarget(self, action: #selector(phoneTextFieldValueChanged), for: .valueChanged)
    return $0
  }(UITextField())
  private(set) lazy var divider: UIView = UIView()
  
  public weak var output: UnderscoredTextFieldOutput?
  
  internal lazy var layout: Layout = Layout()
  
  override public init() {
    super.init()
    
    createUI()
    configureUI()
  }
  
  private func createUI() {
    [
      phoneTextField,
      divider
      ].forEach { container.addSubview($0) }
    
    addSubview(container)
  }
  
  private func configureUI() {
    phoneTextField.attributedPlaceholder = NSAttributedString.init(string: placeholder, attributes: [.foregroundColor:
      ThemeManager.current().textColors.placeholder])
    divider.backgroundColor = ThemeManager.current().colors.divider
  }
  
  override public func configureLayout(block: @escaping YGLayoutConfigurationBlock) {
    container.configureLayout(block: layout.container)
    phoneTextField.configureLayout(block: layout.phoneTextField)
    divider.configureLayout(block: layout.divider)
    
    super.configureLayout(block: block)
  }
  
  @objc func phoneTextFieldValueChanged() {
    output?.valueDidChange(newVal: phoneTextField.text ?? "")
  }
}

extension UnderscoredTextField : UnderscoredTextFieldInput {
  
}
