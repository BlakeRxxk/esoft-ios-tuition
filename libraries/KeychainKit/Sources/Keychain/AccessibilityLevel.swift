//
//  AccessibilityLevel.swift
//  KeychainKit
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation

public enum AccessibilityLevel {
  /// The data in the keychain can only be accessed when the device is unlocked.
  /// Only available if a passcode is set on the device
  ///
  ///  For more information, see [Keychain Services](https://developer.apple.com/documentation/security/ksecattraccessiblewhenpasscodesetthisdeviceonly)
  case whenPasscodeSetThisDeviceOnly
  
  /// The data in the keychain item can be accessed only while the device is unlocked by the user.
  case unlockedThisDeviceOnly
  
  /// The data in the keychain item can be accessed only while the device is unlocked by the user.
  case whenUnlocked
  
  /// The data in the keychain item cannot be accessed after a restart until the device has been unlocked once by the user.
  case afterFirstUnlockThisDeviceOnly
  
  /// The data in the keychain item cannot be accessed after a restart until the device has been unlocked once by the user.
  case afterFirstUnlock
  
  /// The data in the keychain item can always be accessed regardless of whether the device is locked.
  @available(iOS, deprecated: 12.0, message: "This is not recommended for application use. Items with this attribute do not migrate to a new device.")
  case alwaysThisDeviceOnly
  
  /// The data in the keychain item can always be accessed regardless of whether the device is locked.
  @available(iOS, deprecated: 12.0, message: "This is not recommended for application use.")
  case accessibleAlways
}
