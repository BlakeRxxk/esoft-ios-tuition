//
//  KeychainTests.swift
//  KeychainKitTests
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import XCTest
@testable import KeychainKit

class KeychainTests: XCTestCase {
  func test_updateRequestAttributes_returnDefaultAttributes() {
    let keychain = Keychain(service: "",
                            accessible: .whenUnlocked,
                            synchronizable: false)
    
    let attributes =  keychain.updateRequestAttributes(value: Data())
    
    //    XCTAssertTrue(attributes.contains { $0 == Attribute.valueData(Data()) })
    //    XCTAssertTrue(attributes.contains { $0 == Attribute.accessible(.whenUnlocked) })
    //    XCTAssertTrue(attributes.contains { $0 == Attribute.synchronizable(.init(boolValue: false)) })
    XCTAssertEqual(attributes.count, 3)
  }
  
  func test_addRequestAttributes_returnDefaultAttributes() {
    let keychain = Keychain(service: "",
                            accessible: .whenUnlocked,
                            synchronizable: false)
    
    let attributes = keychain.addRequestAttributes(value: Data(), key: "account")
    
    XCTAssertEqual(attributes.count, 7)
    // attributes from updateRequestAttributes
    //    XCTAssertTrue(attributes.contains { $0 == Attribute.valueData(Data()) })
    //    XCTAssertTrue(attributes.contains { $0 == Attribute.accessible(.whenUnlocked) })
    //    XCTAssertTrue(attributes.contains { $0 == Attribute.synchronizable(.init(boolValue: false)) })
    
    // attributes from addRequestAttributes
    //    XCTAssertTrue(attributes.contains { $0 == Attribute.account("account") })
  }
}
