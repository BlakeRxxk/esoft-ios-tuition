//
//  KeychainBridgeArchivable.swift
//  KeychainKit
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation

class KeychainBridgeArchivable<T: NSCoding>: KeychainBridge<T> {
  override public func set(_ value: T, forKey key: String, in keychain: Keychain) throws {
    // TODO: iOS 13 deprecated +archivedDataWithRootObject:requiringSecureCoding:error:
    let data = NSKeyedArchiver.archivedData(withRootObject: value)
    try persist(value: data, key: key, keychain: keychain)
  }
  
  override public func get(key: String, from keychain: Keychain) throws -> T? {
    guard let data = try find(key: key, keychain: keychain) else { return nil }
    
    // TODO: iOS 13 deprecated +unarchivedObjectOfClass:fromData:error:
    guard let object = NSKeyedUnarchiver.unarchiveObject(with: data) as? T else {
      throw KeychainError.invalidDataCast
    }
    
    return object
  }
}
