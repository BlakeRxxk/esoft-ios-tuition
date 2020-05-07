//
//  Store+Equatable.swift
//  StateKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

public extension Store where Self: Equatable, State: Equatable {
  static func == (lhs: Self, rhs: Self) -> Bool {
    lhs.currentState == rhs.currentState
  }
}
