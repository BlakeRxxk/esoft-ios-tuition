//
//  TestStore.swift
//  StateKitTests
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation
import StateKit

final class TestStore: Store {
  typealias Action = Never
  struct State {}
  let initialState = State()
}
