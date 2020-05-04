//
//  StoreHashableTests.swift
//  StateKitTests
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import XCTest
import StateKit
import RxSwift

final class StoreHashableTests: XCTestCase {
  func testReactorHashValue() {
    let storeA = PostStoreHashable(id: "a", viewCount: 0)
    let storeB = PostStoreHashable(id: "a", viewCount: 1)
    XCTAssertNotEqual(storeA.currentState.hashValue, storeB.currentState.hashValue)
    XCTAssertNotEqual(storeA.hashValue, storeB.hashValue)
    
    storeA.action.onNext(.view)
    XCTAssertEqual(storeA.currentState.hashValue, storeB.currentState.hashValue)
    XCTAssertEqual(storeA.hashValue, storeB.hashValue)
    
    storeA.action.onNext(.view)
    XCTAssertNotEqual(storeA.currentState.hashValue, storeB.currentState.hashValue)
    XCTAssertNotEqual(storeA.hashValue, storeB.hashValue)
    
    storeB.action.onNext(.view)
    XCTAssertEqual(storeA.currentState.hashValue, storeB.currentState.hashValue)
    XCTAssertEqual(storeA.hashValue, storeB.hashValue)
  }
}
