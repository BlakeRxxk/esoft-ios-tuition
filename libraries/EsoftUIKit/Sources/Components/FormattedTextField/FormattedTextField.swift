//
//  FormattedTextField.swift
//  EsoftUIKit#iphonesimulator-x86_64
//
//  Created by nedstar on 13.05.2020.
//

import UIKit
import YogaKit
import ThemeManager
import BaseUI

// Нужен ли вообще этот компонент? (Вроде да)
// Нельзя ли как-то расширить UITextField? (Вроде нет)
public final class FormattedTextField : View {
  public var placeholder: String {
    get {
      textField.placeholder ?? ""
    }
    set {
      textField.attributedPlaceholder = NSAttributedString(string: newValue, attributes: [.foregroundColor: ThemeManager.current().textColors.placeholder])
    }
  }
  public var isSecureTextEntry: Bool {
    get {
      textField.isSecureTextEntry
    }
    set {
      textField.isSecureTextEntry = newValue
    }
  }
  public var keyboardType: UIKeyboardType {
    get {
      return textField.keyboardType
    }
    set {
      textField.keyboardType = newValue
    }
  }
  public var formatter: ((String) -> String)?
  
  public weak var output: FormattedTextFieldOutput?
  
  internal lazy var layout: Layout = Layout()
  
  private(set) lazy var textField: UITextField = {
    // заменить на rx
    $0.addTarget(self, action: #selector(textFieldValueChanged), for: .editingChanged)
    return $0
  }(UITextField())
  
  public override init() {
    super.init()
    
    configureUI()
    createUI()
  }
  
  private func createUI() {
    addSubview(textField)
  }
  
  private func configureUI() {
  }
  
  override public func layoutSubviews() {
    super.layoutSubviews()

    configureLayout(block: layout.container)

    textField.configureLayout(block: layout.textField)
    
    yoga.applyLayout(preservingOrigin: true)
  }
  
  @objc func textFieldValueChanged() {
    if let formatter = self.formatter {
      // заменить на rx
      textField.text = formatter(textField.text ?? "")
    }
    output?.valueDidChange(sender: self, newVal: textField.text ?? "")
  }
}
