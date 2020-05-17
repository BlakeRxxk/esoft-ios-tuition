//
//  FormattedTextFieldIO.swift
//  EsoftUIKit#iphonesimulator-x86_64
//
//  Created by nedstar on 13.05.2020.
//

import UIKit

public protocol FormattedTextFieldInput {
  // Стартовое значение?
}

public protocol FormattedTextFieldOutput: AnyObject {
  func valueDidChange(sender: FormattedTextField, newVal: String)
}
