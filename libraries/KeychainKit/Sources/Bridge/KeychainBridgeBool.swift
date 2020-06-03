//
//  KeychainBridgeBool.swift
//  KeychainKit
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation

class KeychainBridgeBool: KeychainBridge<Bool> {
  override public func set(_ value: Bool, forKey key: String, in keychain: Keychain) throws {
    let bytes: [UInt8] = value ? [1] : [0]
    let data = Data(bytes)
    try persist(value: data, key: key, keychain: keychain)
  }
  
  override public func get(key: String, from keychain: Keychain) throws -> Bool? {
    guard let data = try find(key: key, keychain: keychain), let firstBit = data.first else {
      return nil
    }
    
    return firstBit == 1
  }
}
