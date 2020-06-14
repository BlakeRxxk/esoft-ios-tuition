//
//  KeychainBridgeData.swift
//  KeychainKit
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation

class KeychainBridgeData: KeychainBridge<Data> {
  override public func set(_ value: Data, forKey key: String, in keychain: Keychain) throws {
    try persist(value: value, key: key, keychain: keychain)
  }
  
  override public func get(key: String, from keychain: Keychain) throws -> Data? {
    try find(key: key, keychain: keychain)
  }
}
