//
//  Attribute.swift
//  KeychainKit
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation

typealias Attributes = [Attribute]

enum Attribute {
  case `class`(ItemClass)
  case service(String)
  case account(String)
  case valueData(Data)
  case accessible(AccessibilityLevel)
  case isReturnData(Bool)
  case matchLimit(MatchLimit)
  case accessGroup(String)
  case synchronizable(Synchronizable)
  case server(String)
  case port(Int)
  case protocolType(ProtocolType)
  case authenticationType(AuthenticationType)
  case securityDomain(String)
  case path(String)
  case label(String)
  case comment(String)
  case attrDescription(String)
  case isInvisible(Bool)
  case isNegative(Bool)
  
  var rawValue: Element {
    switch self {
    case .class(let value):
      return Element(key: kSecClass, value: value.rawValue)
    case .service(let value):
      return Element(key: kSecAttrService, value: value)
    case .account(let value):
      return Element(key: kSecAttrAccount, value: value)
    case .valueData(let data):
      return Element(key: kSecValueData, value: data)
    case .accessible(let level):
      return Element(key: kSecAttrAccessible, value: level.rawValue)
    case .isReturnData(let isReturn):
      let value = isReturn ? kCFBooleanTrue : kCFBooleanFalse
      return Element(key: kSecReturnData, value: value as Any)
    case .matchLimit(let value):
      return Element(key: kSecMatchLimit, value: value.rawValue)
    case .accessGroup(let value):
      return Element(key: kSecAttrAccessGroup, value: value)
    case .synchronizable(let value):
      return Element(key: kSecAttrSynchronizable, value: value.rawValue)
    case .server(let value):
      return Element(key: kSecAttrServer, value: value)
    case .port(let value):
      return Element(key: kSecAttrPort, value: value)
    case .protocolType(let value):
      return Element(key: kSecAttrAuthenticationType, value: value.rawValue)
    case .authenticationType(let value):
      return Element(key: kSecAttrAuthenticationType, value: value.rawValue)
    case .securityDomain(let value):
      return Element(key: kSecAttrSecurityDomain, value: value)
    case .path(let value):
      return Element(key: kSecAttrPath, value: value)
    case .label(let value):
      return Element(key: kSecAttrLabel, value: value)
    case .comment(let value):
      return Element(key: kSecAttrComment, value: value)
    case .attrDescription(let value):
      return Element(key: kSecAttrDescription, value: value)
    case .isInvisible(let value):
      return Element(key: kSecAttrIsInvisible, value: NSNumber(value: value))
    case .isNegative(let value):
      return Element(key: kSecAttrIsNegative, value: NSNumber(value: value))
    }
  }
}

extension Attribute {
  struct Element {
    let key: String
    let value: Any
    
    init(key: CFString, value: Any) {
      self.key = String(key)
      self.value = value
    }
  }
  
  enum MatchLimit {
    case one
    case all
    
    var rawValue: CFString {
      switch self {
      case .one:
        return kSecMatchLimitOne
      case .all:
        return kSecMatchLimitAll
      }
    }
  }
  
  enum Synchronizable {
    /// Query for both synchronizable and non-synchronizable results
    case any
    case yes
    case no
    
    var rawValue: AnyObject {
      switch self {
      case .any:
        return kSecAttrSynchronizableAny
      case .yes:
        return kCFBooleanTrue
      case .no:
        return kCFBooleanFalse
      }
    }
    
    init(boolValue: Bool) {
      self = boolValue ? Synchronizable.yes : Synchronizable.no
    }
  }
}
