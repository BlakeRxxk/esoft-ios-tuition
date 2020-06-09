//
//  KeychainKeys.swift
//  KeychainKit
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation

/**
 Extend this class and add your user defaults keys as static constants so you can use the shortcut dot notation
 (e.g. `Keychain[.yourKey]`)
 Example:
 ```
 extension KeychainKeys {
 static let yourKey = KeychainKey<String>(key: "key")
 }
 ```
 */

open class KeychainKey<ValueType: KeychainSerializable>: KeychainKeys {
  public let key: String
  
  public init(key: String) {
    self.key = key
  }
}

open class KeychainKeys {}
