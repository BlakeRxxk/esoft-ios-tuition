//
//  PersonNameDefaultFormatter.swift
//  EsoftUIKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

public struct PersonNameDefaultFormatter: Formatter {
  public init() {}
  
  public func format(input: String) -> String? {
    let fullname = PersonNameFactory.makeComponents(from: input)
    return PersonNameFactory.defaultOutputFormatter.annotatedString(from: fullname).string
  }
}
