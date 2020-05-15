//
//  DateOutputFormatter.swift
//  ESUIKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation

public struct DateOutputFormatter: Formatter {

  public func format(input: String) -> String? {
    guard let date = DateFactory.dateInputFormatter.date(from: input) else { return nil }
    return DateFactory.dateOutputFormatter.string(from: date)
  }
}
