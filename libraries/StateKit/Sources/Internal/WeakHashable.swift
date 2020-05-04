//
//  WeakHashable.swift
//  StateKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation

internal class Weak<T>: Hashable where T: AnyObject {
  private let objectHashValue: Int
  weak var object: T?
  
  init(_ object: T) {
    self.objectHashValue = ObjectIdentifier(object).hashValue
    self.object = object
  }
  
  static func == (lhs: Weak<T>, rhs: Weak<T>) -> Bool {
    lhs.objectHashValue == rhs.objectHashValue
  }
  
  func hash(into hasher: inout Hasher) {
    hasher.combine(self.objectHashValue)
  }
}
