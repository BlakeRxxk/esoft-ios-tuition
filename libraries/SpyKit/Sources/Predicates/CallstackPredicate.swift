//
//  CallstackPredicate.swift
//  SpyKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation

public protocol CallstackPredicate {
  associatedtype Method: Equatable
  
  func check(method: Method, against callstack: [Method]) -> Bool
  func description(forMethod method: Method) -> String
}
