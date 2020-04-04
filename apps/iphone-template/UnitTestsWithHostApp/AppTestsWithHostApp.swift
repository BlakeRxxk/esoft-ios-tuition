//
//  AppTestsWithHostApp.swift
//  UnitTestsWithHostApp
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import XCTest
import HeapInspector
@testable import AppLibrary

final class AppTestsWithHostApp: XCTestCase {
  override func setUp() {
    super.setUp()
    HINSPDebug.start()
    HINSPDebug.addSwiftModules(toRecord: ["AppTestsWithHostApp"])
  }
  
  override func tearDown() {
    HINSPDebug.stop()
    super.tearDown()
  }
  func testExample() {
    let debug = HINSPDebug()
    debug.perform(NSSelectorFromString("beginRecord"))
    let detailViewController = ViewController()
    let recordedObjects = HINSPHeapStackInspector.recordedHeap() as NSSet
    XCTAssertTrue((recordedObjects.count <= 1), "Recorded objects must be one")
    XCTAssertNotNil(detailViewController, "Just to suppres the warning")
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    XCTAssert(1 == 1)
  }
  
}
