//
//  KeychainError+CustomNSErrore.swift
//  KeychainKit
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation

extension KeychainError: CustomNSError {
  public static let errorDomain = keychainAccessErrorDomain
  
  public var errorCode: Int {
    Int(rawValue)
  }
  
  public var errorUserInfo: [String: Any] {
    [NSLocalizedDescriptionKey: description]
  }
}
