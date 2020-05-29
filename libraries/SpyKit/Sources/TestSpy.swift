//
//  TestSpy.swift
//  SpyKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

public protocol TestSpy {
  associatedtype Method: Equatable
  var callstack: CallstackContainer<Method> { get }
}

extension TestSpy {
  public func check<P: CallstackPredicate>(method: Method, predicate: P) -> Bool where P.Method == Method {
    callstack.check(method: method, predicate: predicate)
  }
}
