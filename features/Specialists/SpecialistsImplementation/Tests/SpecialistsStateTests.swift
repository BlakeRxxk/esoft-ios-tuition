//
//  SpecialistsStateTests.swift
//  SpecialistsImplementationTests
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import XCTest
import SpecialistsCore
import RxSwift
import RxBlocking

@testable import SpecialistsImplementation

final class SpecialistsStateTests: XCTestCase {
  
  func testAction_fetchSpecialists() {
    // given
    let store = SpecialistsListState(specialistsUseCase: SpecialistsUseCaseMock())
    store.isStubEnabled = true
    
    let view = TestViewController()
    view.store = store

    // when
    view.viewWillAppear(true)

    // then
    XCTAssertEqual(store.stub.actions.last, .fetchSpecialists(page: 1))
  }
  
  func testAction_refreshSpecialists() {

  }
  
  func testFetchSpecialists() {
    // given
    let store = SpecialistsListState(specialistsUseCase: SpecialistsUseCaseMock())
    
    // when
    store.action.onNext(.fetchSpecialists(page: 1))
    
    // then
    XCTAssertEqual(store.currentState.initialLoading, false)
    XCTAssert(store.currentState.specialists.count == 1)
    XCTAssert(store.currentState.page == 1)
    XCTAssert(store.currentState.pages == 5)
    
    // when
    store.action.onNext(.refreshMySpecialists)
    
    // then
    XCTAssertEqual(store.currentState.initialLoading, false)
    XCTAssert(store.currentState.specialists.count == 1)
    XCTAssert(store.currentState.pages == 5)
  }

}
