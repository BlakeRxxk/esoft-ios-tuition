//
//  PhoneNumberOutputFormatter.swift
//  EsoftUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation

struct PhoneNumberOutputFormatter: Formatter {
  func format(input: String) -> String? {
    input.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
  }
}
