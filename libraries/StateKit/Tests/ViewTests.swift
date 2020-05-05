//
//  ViewTests.swift
//  StateKitTests
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import XCTest
import StateKit
import RxSwift
import UIKit

final class ViewTests: XCTestCase {
  func testBindIsInvoked_differentReactor() {
    let view = TestView()
    XCTAssertEqual(view.bindInvokeCount, 0)
    view.store = TestStore()
    XCTAssertEqual(view.bindInvokeCount, 1)
    view.store = TestStore()
    XCTAssertEqual(view.bindInvokeCount, 2)
  }
  
  func testDisposeBagIsDisposed_differentReactor() {
    let view = TestView()
    let oldHashValue = ObjectIdentifier(view.disposeBag).hashValue
    view.store = TestStore()
    let newHashValue = ObjectIdentifier(view.disposeBag).hashValue
    XCTAssertNotEqual(oldHashValue, newHashValue)
  }
  
  func testReactor_assign() {
    let store = TestStore()
    let view = TestView()
    view.store = store
    XCTAssertNotNil(view.store)
    XCTAssertTrue(view.store === store)
  }
  
  func testReactor_assignNil() {
    let store = TestStore()
    let view = TestView()
    view.store = store
    view.store = nil
    XCTAssertNil(view.store)
  }
  
  func testViewController_alreadyHasView() {
    let viewController = TestViewController()
    _ = viewController.view
    viewController.store = TestStore()
    XCTAssertEqual(viewController.isViewLoaded, true)
    XCTAssertEqual(viewController.bindInvokeCount, 1)
  }
  
  func testDeferBinding_deinitWhileDeferred() {
    weak var weakView: TestViewController?
    weak var weakReactor: TestStore?
    _ = {
      let viewController = TestViewController()
      let store = TestStore()
      weakView = viewController
      weakReactor = store
      viewController.store = store // this will start waiting for view
      XCTAssertNotNil(weakView)
      XCTAssertNotNil(weakReactor)
    }() // viewController is deallocated while waiting (before the view is loaded)
    XCTAssertNil(weakView)
    XCTAssertNil(weakReactor)
  }
  
  func testSwizzlingOriginalMethodInvoked() {
    let viewController = TestViewController()
    XCTAssertEqual(viewController.isLoadViewInvoked, false)
    _ = viewController.view
    XCTAssertEqual(viewController.isLoadViewInvoked, true)
  }
}
