//
//  FormattedTextFieldBuilder.swift
//  EsoftUIKit#iphonesimulator-x86_64
//
//  Created by nedstar on 19.05.2020.
//

import UIKit
import PhoneNumberFormat

public enum FormattedTextFieldType {
  case phone
  case password
}

class FormattedTextFieldBuilder {
  private var textField: FormattedTextField
  
  init() {
    self.textField = FormattedTextField()
  }

  private func set(security: Bool) -> FormattedTextFieldBuilder {
    self.textField.isSecureTextEntry = security
    
    return self
  }
  
  private func set(formatter: @escaping (String) -> String) -> FormattedTextFieldBuilder {
    self.textField.formatter = formatter

    return self
  }
  
  private func set(keyboardType: UIKeyboardType) -> FormattedTextFieldBuilder {
    self.textField.keyboardType = keyboardType
    
    return self
  }
  
  private func build() -> FormattedTextField {
    return self.textField
  }
  
  func build(_ type: FormattedTextFieldType) -> FormattedTextField {
    switch type {
    case .password:
      return buildPassword()
    case .phone:
      return buildPhone()
    }
  }
  
  func buildPassword() -> FormattedTextField {
    return self
      .set(security: true)
      .build()
  }
  
  func buildPhone() -> FormattedTextField {
    return self
      .set(formatter: formatPhoneNumber)
      .set(keyboardType: .numberPad)
      .build()
  }
}
