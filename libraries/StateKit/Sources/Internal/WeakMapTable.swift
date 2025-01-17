//
//  WeakMapTable.swift
//  StateKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation

// MARK: - WeakMapTable
final class WeakMapTable<Key, Value> where Key: AnyObject {
  private var dictionary: [Weak<Key>: Value] = [:]
  private let lock = NSRecursiveLock()
  
  // MARK: Dealloc Hook
  private var deallocHookKey: Void?

  // MARK: Getting and Setting Values
  func value(forKey key: Key) -> Value? {
    let weakKey = Weak(key)
    
    self.lock.lock()
    defer {
      self.lock.unlock()
      self.installDeallocHook(to: key)
    }
    
    return self.unsafeValue(forKey: weakKey)
  }
  
  func value(forKey key: Key, default: @autoclosure () -> Value) -> Value {
    let weakKey = Weak(key)
    
    self.lock.lock()
    defer {
      self.lock.unlock()
      self.installDeallocHook(to: key)
    }
    
    if let value = self.unsafeValue(forKey: weakKey) {
      return value
    }
    
    let defaultValue = `default`()
    self.unsafeSetValue(defaultValue, forKey: weakKey)
    return defaultValue
  }
  
  func forceCastedValue<T>(forKey key: Key, default: @autoclosure () -> T) -> T {
    self.value(forKey: key, default: `default`() as! Value) as! T
  }
  
  func setValue(_ value: Value?, forKey key: Key) {
    let weakKey = Weak(key)
    
    self.lock.lock()
    defer {
      self.lock.unlock()
      if value != nil {
        self.installDeallocHook(to: key)
      }
    }
    
    if let value = value {
      self.dictionary[weakKey] = value
    } else {
      self.dictionary.removeValue(forKey: weakKey)
    }
  }
  
  // MARK: Getting and Setting Values without Locking
  private func unsafeValue(forKey key: Weak<Key>) -> Value? {
    self.dictionary[key]
  }
  
  private func unsafeSetValue(_ value: Value?, forKey key: Weak<Key>) {
    if let value = value {
      self.dictionary[key] = value
    } else {
      self.dictionary.removeValue(forKey: key)
    }
  }

  private func installDeallocHook(to key: Key) {
    let isInstalled = (objc_getAssociatedObject(key, &deallocHookKey) != nil)
    guard !isInstalled else { return }
    
    let weakKey = Weak(key)
    let hook = DeallocHook(handler: { [weak self] in
      self?.lock.lock()
      self?.dictionary.removeValue(forKey: weakKey)
      self?.lock.unlock()
    })
    objc_setAssociatedObject(key, &deallocHookKey, hook, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
  }
}
