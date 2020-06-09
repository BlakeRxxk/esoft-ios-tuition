//
//  ItemClass.swift
//  KeychainKit
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation

public enum ItemClass {
  /// The value that indicates a Generic password item.
  ///
  /// For more information, see [Keychain Services](https://developer.apple.com/documentation/security/ksecclassgenericpassword)
  case genericPassword
  
  /// The value that indicates an Internet password item.
  ///
  /// For more information, see [Keychain Services](https://developer.apple.com/documentation/security/ksecclassinternetpassword)
  case internetPassword
}
