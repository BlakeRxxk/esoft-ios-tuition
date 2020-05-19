//
//  SocialStackIO.swift
//  AppLibrary
//
//  Created by nedstar on 24.04.2020.
//

import UIKit

public protocol NotifyingTextFieldInput {
  var errorMessage: String? { get set }
}

public protocol NotifyingTextFieldOutput: AnyObject {
  func valueDidChange(sender: NotifyingTextField, newVal: String)
}
