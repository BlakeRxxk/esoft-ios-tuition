//
//  PersonNameFormatter.swift
//  ESUIKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

public struct PersonNameFormatter: Formatter {
  public init() {}

  public func format(input: String) -> String? {
    let fullname = PersonNameFactory.makeComponents(from: input)
    return PersonNameFactory.avatarOutputFormatter.annotatedString(from: fullname).string
  }
}
