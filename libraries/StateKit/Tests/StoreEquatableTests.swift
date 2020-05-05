//
//  StoreEquatableTests.swift
//  StateKitTests
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import XCTest
import StateKit
import RxSwift

final class StoreEquatableTests: XCTestCase {
  func testReactorEqual_whenCurrentStatesAreEqual() {
    let storeA = PostStoreEquatable(id: "a", viewCount: 0)
    let storeB = PostStoreEquatable(id: "a", viewCount: 1)
    XCTAssertNotEqual(storeA.currentState, storeB.currentState)
    XCTAssertNotEqual(storeA, storeB)
    
    storeA.action.onNext(.view)
    XCTAssertEqual(storeA.currentState, storeB.currentState)
    XCTAssertEqual(storeA, storeB)
    
    storeA.action.onNext(.view)
    XCTAssertNotEqual(storeA.currentState, storeB.currentState)
    XCTAssertNotEqual(storeA, storeB)
    
    storeB.action.onNext(.view)
    XCTAssertEqual(storeA.currentState, storeB.currentState)
    XCTAssertEqual(storeA, storeB)
  }
}
