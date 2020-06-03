//
//  KeychainBridgeCodable.swift
//  KeychainKit
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation

class KeychainBridgeCodable<T: Codable>: KeychainBridge<T> {
  override public func set(_ value: T, forKey key: String, in keychain: Keychain) throws {
    try persist(value: try JSONEncoder().encode(value), key: key, keychain: keychain)
  }
  
  override public func get(key: String, from keychain: Keychain) throws -> T? {
    guard let data = try find(key: key, keychain: keychain) else { return nil }
    return try JSONDecoder().decode(T.self, from: data)
  }
}
