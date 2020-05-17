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
  public var formatter: ((String) -> String)?
  
  public weak var output: FormattedTextFieldOutput?
  
  internal lazy var layout: Layout = Layout()
  
  private(set) lazy var textField: UITextField = {
    $0.addTarget(self, action: #selector(textFieldValueChanged), for: .valueChanged)
    return $0
  }(UITextField())
  
  public init(formatter: @escaping ((String)->String)) {
    super.init()
    
    self.formatter = formatter
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
    output?.valueDidChange(sender: self, newVal: textField.text ?? "")
  }
}
