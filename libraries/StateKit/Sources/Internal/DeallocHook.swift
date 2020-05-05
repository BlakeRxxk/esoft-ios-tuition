//
//  DeallocHook.swift
//  StateKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation

internal class DeallocHook {
  private let handler: () -> Void
  
  init(handler: @escaping () -> Void) {
    self.handler = handler
  }
  
  deinit {
    self.handler()
  }
}
