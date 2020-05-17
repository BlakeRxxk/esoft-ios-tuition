//
//  PhoneNumberOutputFormatter.swift
//  ESUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation

struct PhoneNumberOutputFormatter: Formatter {
  func format(input: String) -> String? {
    return input.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
  }
}
