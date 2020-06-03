//
//  KeychainBridgeString.swift
//  KeychainKit
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation

class KeychainBridgeString: KeychainBridge<String> {
  override public func set(_ value: String, forKey key: String, in keychain: Keychain) throws {
    guard let data = value.data(using: .utf8) else {
      throw KeychainError.conversionError
    }
    
    try persist(value: data, key: key, keychain: keychain)
  }
  
  override public func get(key: String, from keychain: Keychain) throws -> String? {
    guard let data = try find(key: key, keychain: keychain) else { return nil }
    return String(data: data, encoding: .utf8)
  }
}
