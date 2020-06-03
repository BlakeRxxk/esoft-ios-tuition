//
//  KeychainEnumsTests.swift
//  KeychainKitTests
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import XCTest
@testable import KeychainKit

class KeychainEnumsSpec: XCTestCase {
  func testItemClassEnum() {
    XCTAssertEqual(ItemClass.genericPassword.rawValue, kSecClassGenericPassword)
    XCTAssertEqual(ItemClass.internetPassword.rawValue, kSecClassInternetPassword)
  }
  
  func testAccessibilityLevelEnum() {
    XCTAssertEqual(AccessibilityLevel.whenPasscodeSetThisDeviceOnly.rawValue, kSecAttrAccessibleWhenPasscodeSetThisDeviceOnly)
    XCTAssertEqual(AccessibilityLevel.unlockedThisDeviceOnly.rawValue, kSecAttrAccessibleWhenUnlockedThisDeviceOnly)
    
    XCTAssertEqual(AccessibilityLevel.whenUnlocked.rawValue, kSecAttrAccessibleWhenUnlocked)
    XCTAssertEqual(AccessibilityLevel.afterFirstUnlockThisDeviceOnly.rawValue, kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly)
    XCTAssertEqual(AccessibilityLevel.afterFirstUnlock.rawValue, kSecAttrAccessibleAfterFirstUnlock)
    XCTAssertEqual(AccessibilityLevel.alwaysThisDeviceOnly.rawValue, kSecAttrAccessibleAlwaysThisDeviceOnly)
    XCTAssertEqual(AccessibilityLevel.accessibleAlways.rawValue, kSecAttrAccessibleAlways)
  }
}
