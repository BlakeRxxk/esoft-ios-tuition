//
//  KeychainSerializable.swift
//  KeychainKit
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation

public protocol KeychainSerializable {
  associatedtype Convertible
  
  static var bridge: KeychainBridge<Convertible> { get }
}

extension Int: KeychainSerializable {
  public static var bridge: KeychainBridge<Int> { KeychainBridgeInt() }
}

extension String: KeychainSerializable {
  public static var bridge: KeychainBridge<String> { KeychainBridgeString() }
}

extension Double: KeychainSerializable {
  public static var bridge: KeychainBridge<Double> { KeychainBridgeDouble() }
}

extension Float: KeychainSerializable {
  public static var bridge: KeychainBridge<Float> { KeychainBridgeFloat() }
}

extension Bool: KeychainSerializable {
  public static var bridge: KeychainBridge<Bool> { KeychainBridgeBool() }
}

extension Data: KeychainSerializable {
  public static var bridge: KeychainBridge<Data> { KeychainBridgeData() }
}

extension KeychainSerializable where Self: Codable {
  public static var bridge: KeychainBridge<Self> { KeychainBridgeCodable() }
}

extension KeychainSerializable where Self: NSCoding {
  public static var bridge: KeychainBridge<Self> { KeychainBridgeArchivable() }
}
