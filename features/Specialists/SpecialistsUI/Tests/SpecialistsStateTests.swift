//
//  SpecialistsStateTests.swift
//  SpecialistsUITests
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import XCTest
import SpecialistsCore
import RxSwift
import RxBlocking

@testable import SpecialistsUI

final class SpecialistsStateTests: XCTestCase {
  var store: SpecialistsListState?
  
  override func setUp() {
    super.setUp()
    
    store = SpecialistsListState(specialistsUseCase: SpecialistsUseCaseMock())
  }
  
  func testAction_fetchSpecialists() {
    // given
    store?.isStubEnabled = true
    
    let view = TestViewController()
    view.store = store
    
    // when
    view.viewWillAppear(true)
    
    // then
    XCTAssertEqual(store?.stub.actions.last, .fetchSpecialists(page: 1))
    
    addTeardownBlock { [unowned self] in
      self.store = nil
    }
  }
  
  func testAction_refreshSpecialists() {
    
  }
  
  func testFetchSpecialists() {
    // given
    store?.scheduler = MainScheduler.instance

    // when
    store?.action.onNext(.fetchSpecialists(page: 1))

    // then
    XCTAssertEqual(store?.currentState.initialLoading, false)
    XCTAssert(store?.currentState.specialists.count == 1)
    XCTAssert(store?.currentState.page == 1)
    XCTAssert(store?.currentState.pages == 5)
    
    // when
    store?.action.onNext(.refreshMySpecialists)
    
    // then
    XCTAssertEqual(store?.currentState.initialLoading, false)
    XCTAssert(store?.currentState.specialists.count == 1)
    XCTAssert(store?.currentState.pages == 5)
    
    addTeardownBlock { [unowned self] in
      self.store = nil
    }
  }
  
}
