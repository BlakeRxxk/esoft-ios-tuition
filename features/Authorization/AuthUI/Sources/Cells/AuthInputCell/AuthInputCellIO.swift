//
//  AuthInputCellIO.swift
//  AuthUI#iphonesimulator-x86_64
//
//  Created by nedstar on 19.06.2020.
//

import UIKit

public protocol AuthInputCellInput {
  typealias MyFormatter = (String) -> String
  
  var text: String? { get set }
  var placeholder: String? { get set }
  var showButton: Bool { get set }
  var formatter: MyFormatter? { get set }
  var keyboardType: UIKeyboardType { get set }
  var errorMessage: String? { get set }
}

public protocol AuthInputCellOutput: AnyObject {
  func textDidChange(newVal: String)
}
