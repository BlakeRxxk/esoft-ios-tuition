//
//  KeychainBridge.swift
//  KeychainKit
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation
import Security

open class KeychainBridge<T> {
  public init() {}
  
  open func set(_ value: T, forKey key: String, in keychain: Keychain) throws {
    fatalError("abstract method should be overriden")
  }
  
  open func get(key: String, from keychain: Keychain) throws -> T? {
    fatalError("abstract method should be overriden")
  }
  
  public func remove(key: String, from keychain: Keychain) throws {
    let query = keychain.searchQuery([
      .account(key)
    ])
    
    let status = Keychain.itemDelete(query)
    if status != errSecSuccess && status != errSecItemNotFound {
      throw KeychainError(status: status)
    }
  }
}

public extension KeychainBridge {
  func persist(value: Data, key: String, keychain: Keychain) throws {
    let query: [Attribute] = keychain.searchQuery([
      .account(key)
    ])
    
    let status = Keychain.itemFetch(query)
    
    switch status {
    // Keychain already contains key -> update existing item
    case errSecSuccess:
      let attributes = keychain.updateRequestAttributes(value: value)
      
      let status = Keychain.itemUpdate(query, attributes)
      if status != errSecSuccess {
        throw KeychainError(status: status)
      }
      
    // Keychain doesn't contain key -> add new item
    case errSecItemNotFound:
      let attributes = keychain.addRequestAttributes(value: value, key: key)
      
      let status = Keychain.itemAdd(attributes)
      if status != errSecSuccess {
        throw KeychainError(status: status)
      }
      
      // This error can happen when your app is launched in the background while the device is locked
      // (for example, in response to an actionable push notification or a Core Location geofence event),
      // the application may crash as a result of accessing a locked keychain entry.
      //
    // TODO: Maybe introduce `force` property to allow remove and save key with different permissions
    case errSecInteractionNotAllowed:
      throw KeychainError(status: status)
      
    default:
      throw KeychainError(status: status)
    }
  }
  
  func find(key: String, keychain: Keychain) throws -> Data? {
    let query: Attributes = keychain.searchQuery([
      .account(key),
      .isReturnData(true),
      .matchLimit(.one)
    ])
    
    var result: AnyObject?
    let status = SecItemCopyMatching(query.compose(), &result)
    switch status {
    case errSecSuccess:
      guard let data = result as? Data else {
        throw KeychainError.unexpectedError
      }
      return data
    case errSecItemNotFound:
      return nil
    default:
      throw KeychainError(status: status)
    }
  }
}
