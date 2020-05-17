//
//  SocialStackIO.swift
//  AppLibrary
//
//  Created by nedstar on 24.04.2020.
//

import UIKit

public protocol UnderscoredTextFieldInput {
  var errorMessage: String? { get set }
}

public protocol UnderscoredTextFieldOutput: AnyObject {
  func valueDidChange(sender: UnderscoredTextField, newVal: String)
}
