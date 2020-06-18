//
//  PasswordCellIO.swift
//  AuthUI#iphonesimulator-x86_64
//
//  Created by nedstar on 18.06.2020.
//

import Foundation

public protocol PasswordCellInput: AnyObject {
  var errorMessage: String? { get set }
  var isWaiting: Bool { get set }
}


public protocol PasswordCellOutput: AnyObject {
  func didTapContinueButton()
  func passwordDidChange(newVal: String)
}
