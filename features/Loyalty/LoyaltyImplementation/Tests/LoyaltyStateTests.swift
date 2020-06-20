//
//  LoyaltyStateTests.swift
//  LoyaltyImplementationTests
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import XCTest
import LoyaltyCore
import RxSwift
import RxBlocking

@testable import LoyaltyImplementation

final class LoyaltyStateTests: XCTestCase {
  var store: LoyaltyListState?
  
  override func setUp() {
    super.setUp()
    
    // store = LoyaltyListState(loyaltyUseCase: LoyaltyUseCaseMock())
  }
  
  func testAction_fetchLoyalty() {
    // // given
    // store?.isStubEnabled = true
    
    // let view = TestViewController()
    // view.store = store
    
    // // when
    // view.viewWillAppear(true)
    
    // // then
    // XCTAssertEqual(store?.stub.actions.last, .fetchLoyalty(page: 1))
    
    // addTeardownBlock { [unowned self] in
    //   self.store = nil
    // }
  }
  
  func testAction_refreshLoyalty() {
    
  }
  
  func testFetchLoyalty() {
    // given
    
    // when
    // store?.action.onNext(.fetchLoyalty(page: 1))
    
    // // then
    // XCTAssertEqual(store?.currentState.initialLoading, false)
    // XCTAssert(store?.currentState.loyalty.count == 1)
    // XCTAssert(store?.currentState.page == 1)
    // XCTAssert(store?.currentState.pages == 5)
    
    // // when
    // store?.action.onNext(.refreshMyLoyalty)
    
    // // then
    // XCTAssertEqual(store?.currentState.initialLoading, false)
    // XCTAssert(store?.currentState.loyalty.count == 1)
    // XCTAssert(store?.currentState.pages == 5)
    
    // addTeardownBlock { [unowned self] in
    //   self.store = nil
    // }
  }
  
}
