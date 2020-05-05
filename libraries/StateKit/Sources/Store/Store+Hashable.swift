//
//  Store+Hashable.swift
//  StateKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

public extension Store where Self: Hashable, State: Hashable {
  func hash(into hasher: inout Hasher) {
    hasher.combine(self.currentState.hashValue)
  }
}
