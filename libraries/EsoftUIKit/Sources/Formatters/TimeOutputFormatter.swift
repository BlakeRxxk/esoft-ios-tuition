//
//  TimeOutputFormatter.swift
//  EsoftUIKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

struct TimeOutputFormatter: Formatter {
  
  func format(input: String) -> String? {
    guard let date = DateFactory.timeInputFormatter.date(from: input) else { return nil }
    return DateFactory.timeOutputFormatter.string(from: date)
  }
}
