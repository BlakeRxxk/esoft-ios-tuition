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
public final class FormattedTextField: View {
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
      textField.keyboardType
    }
    set {
      textField.keyboardType = newValue
    }
  }
  
  public var formatter: ((String) -> String)?
  
  private(set) lazy var textField: UITextField = {
    // заменить на rx
    $0.addTarget(self, action: #selector(textFieldValueChanged), for: .editingChanged)
    return $0
  }(UITextField())
  
  public weak var output: FormattedTextFieldOutput?
  
  public override init() {
    super.init()
    
    createUI()
  }
  
  private func createUI() {
    addSubview(textField)
  }
  
  override public func layoutSubviews() {
    super.layoutSubviews()
    
    configureLayout(block: { layout in
      layout.isEnabled = true
      layout.width = 100%
      layout.height = 100%
      layout.flexDirection = .column
    })
    
    textField.configureLayout(block: { layout in
      layout.isEnabled = true
    })
    
    yoga.applyLayout(preservingOrigin: true)
  }
  
  @objc func textFieldValueChanged() {
    if let formatter = self.formatter {
      // заменить на rx
      textField.text = formatter(textField.text ?? "")
    }
    // Сделать так, чтобы он возвращал неотформатированную строчку?
    output?.valueDidChange(sender: self, newVal: textField.text ?? "")
  }
}
