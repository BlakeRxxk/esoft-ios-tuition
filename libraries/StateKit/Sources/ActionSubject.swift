//
//  ActionSubject.swift
//  StateKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import RxSwift
import class Foundation.NSLock.NSRecursiveLock

/// A special subject for Store's Action. It only emits `.next` event.
public final class ActionSubject<Element>: ObservableType, ObserverType, SubjectType {
  typealias Key = UInt
  
  var lock = NSRecursiveLock()
  
  var nextKey: Key = 0
  var observers: [Key: (Event<Element>) -> Void] = [:]
  
  #if TRACE_RESOURCES
  init() {
    _ = Resources.incrementTotal()
  }
  #endif
  
  public func subscribe<O: ObserverType>(_ observer: O) -> Disposable where O.Element == Element {
    self.lock.lock()
    let key = self.nextKey
    self.nextKey += 1
    self.observers[key] = observer.on
    self.lock.unlock()
    
    return Disposables.create { [weak self] in
      self?.lock.lock()
      self?.observers.removeValue(forKey: key)
      self?.lock.unlock()
    }
  }
  
  public func on(_ event: Event<Element>) {
    self.lock.lock()
    if case .next = event {
      self.observers.values.forEach { $0(event) }
    }
    self.lock.unlock()
  }
  
  #if TRACE_RESOURCES
  deinit {
    _ = Resources.decrementTotal()
  }
  #endif
}
