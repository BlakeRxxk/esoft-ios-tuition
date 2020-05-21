//
//  KeyboardResponder.swift
//  ESUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import UIKit

// An abstract interface for responding to and handling keyboard events.
protocol KeyboardResponder: class {
  var inputAccessoryView: UIView? { get set }
  func reloadInputViews()
}

extension UITextView: KeyboardResponder {}
extension UITextField: KeyboardResponder {}
extension UISearchBar: KeyboardResponder {}
