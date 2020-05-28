//
//  RxRealmResultsTests.swift
//  RealmKitTests
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import XCTest
import RealmSwift
import RxSwift

@testable import RealmKit

// swiftlint:disable force_try
class RxRealmResultsTests: XCTestCase {
  func testResultsType() {
    let realm = realmInMemory(#function)
    let messages = Observable.collection(from: realm.objects(Message.self))
      .map { Array($0.map { $0.text }) }
    
    XCTAssertEqual(try! messages.toBlocking().first()!, [])
    
    DispatchQueue.main.async {
      try! realm.write {
        realm.add(Message("first"))
      }
    }
    
    XCTAssertEqual(try! messages.skip(1).toBlocking().first()!, ["first"])
    
    DispatchQueue.main.async {
      try! realm.write {
        realm.delete(realm.objects(Message.self).first!)
      }
    }
    
    XCTAssertEqual(try! messages.skip(1).toBlocking().first()!, [])
  }
  
  func testResultsTypeChangeset() {
    let realm = realmInMemory(#function)
    let messages = Observable.changeset(from: realm.objects(Message.self))
      .map(stringifyChanges)
    
    XCTAssertEqual(try! messages.toBlocking().first()!, "count:0")
    
    DispatchQueue.main.async {
      try! realm.write {
        realm.add(Message("first"))
      }
    }
    
    XCTAssertEqual(try! messages.skip(1).toBlocking().first()!, "count:1 inserted:[0] deleted:[] updated:[]")
    
    DispatchQueue.global(qos: .background).async {
      let realm = realmInMemory(#function)
      try! realm.write {
        realm.delete(realm.objects(Message.self).first!)
      }
    }
    
    XCTAssertEqual(try! messages.skip(1).toBlocking().first()!, "count:0 inserted:[] deleted:[0] updated:[]")
  }
  
  func testResultsEmitsCollectionSynchronously() {
    let realm = realmInMemory(#function)
    let messages = Observable.collection(from: realm.objects(Message.self), synchronousStart: true)
    var result = false
    
    // synchornously set to true
    _ = messages.subscribe(onNext: { _ in
      result = true
    })
    
    XCTAssertEqual(result, true)
  }
  
  func testResultsEmitsChangesetSynchronously() {
    let realm = realmInMemory(#function)
    let messages = Observable.changeset(from: realm.objects(Message.self), synchronousStart: true)
    var result = false
    
    // synchornously set to true
    _ = messages.subscribe(onNext: { _ in
      result = true
    })
    
    XCTAssertEqual(result, true)
  }
  
  func testResultsEmitsCollectionAsynchronously() {
    let realm = realmInMemory(#function)
    let messages = Observable.collection(from: realm.objects(Message.self), synchronousStart: false)
    var result = false
    
    // synchornously set to true
    _ = messages.subscribe(onNext: { _ in
      result = true
    })
    
    XCTAssertEqual(result, false)
  }
  
  func testResultsEmitsChangesetAsynchronously() {
    let realm = realmInMemory(#function)
    let messages = Observable.changeset(from: realm.objects(Message.self), synchronousStart: false)
    var result = false
    
    // synchornously set to true
    _ = messages.subscribe(onNext: { _ in
      result = true
    })
    
    XCTAssertEqual(result, false)
  }
}
// swiftlint:enable force_try
