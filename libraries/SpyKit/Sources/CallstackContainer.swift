//
//  CallstackContainer.swift
//  SpyKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation

public struct CallstackContainer<T: Equatable>: Equatable, CustomStringConvertible {
  var callstack: [T] = []
  
  var isEmpty: Bool {
    callstack.isEmpty
  }
  
  public var description: String {
    "[" + callstack.map { String(describing: $0) }.joined(separator: ", ") + "]"
  }
  
  public init() { }
  
  public static func == <T>(lhs: CallstackContainer<T>, rhs: CallstackContainer<T>) -> Bool {
    lhs.callstack == rhs.callstack
  }
  
  public mutating func record(_ method: T) {
    callstack.append(method)
  }
  
  func check<P: CallstackPredicate>(method: T, predicate: P) -> Bool where P.Method == T {
    predicate.check(method: method, against: callstack)
  }
}

public func == <T>(lhs: CallstackContainer<T>, rhs: [T]) -> Bool {
  lhs.callstack == rhs
}
