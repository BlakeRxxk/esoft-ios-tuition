//
//  KeychainBridgeFloat.swift
//  KeychainKit
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation

class KeychainBridgeFloat: KeychainBridge<Float> {
  override public func set(_ value: Float, forKey key: String, in keychain: Keychain) throws {
    try persist(value: Data(from: value), key: key, keychain: keychain)
  }
  
  override public func get(key: String, from keychain: Keychain) throws -> Float? {
    guard let data = try find(key: key, keychain: keychain) else { return nil }
    return data.convert(type: Float.self)
  }
}
