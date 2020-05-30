//
//  RxRealmListTests.swift
//  RealmKitTests
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import XCTest
import RealmSwift
import RxSwift

@testable import RealmKit

// swiftlint:disable force_try
class RxRealmListTests: XCTestCase {
  func testListType() {
    let realm = realmInMemory(#function)
    
    let message = Message("first")
    try! realm.write {
      realm.add(message)
    }
    
    let users = Observable.collection(from: message.recipients)
      .skip(1)
      .map { $0.count }
    
    DispatchQueue.main.async {
      try! realm.write {
        message.recipients.append(User("user1"))
      }
    }
    
    XCTAssertEqual(try! users.toBlocking().first()!, 1)
    
    DispatchQueue.global(qos: .background).async {
      let realm = realmInMemory(#function)
      let message = realm.objects(Message.self).first!
      try! realm.write {
        message.recipients.remove(at: 0)
      }
    }
    
    XCTAssertEqual(try! users.toBlocking().first()!, 0)
  }
  
  func testListTypeChangeset() {
    let realm = realmInMemory(#function)
    
    let message = Message("first")
    try! realm.write {
      realm.add(message)
    }
    
    let users = Observable.changeset(from: message.recipients)
      .map(stringifyChanges)
    
    XCTAssertEqual(try! users.toBlocking().first()!, "count:0")
    
    DispatchQueue.main.async {
      try! realm.write {
        message.recipients.append(User("user1"))
      }
    }
    
    XCTAssertEqual(try! users.skip(1).toBlocking().first()!, "count:1 inserted:[0] deleted:[] updated:[]")
    
    DispatchQueue.global(qos: .background).async {
      let realm = realmInMemory(#function)
      let message = realm.objects(Message.self).first!
      try! realm.write {
        message.recipients.remove(at: 0)
      }
    }
    
    XCTAssertEqual(try! users.skip(1).toBlocking().first()!, "count:0 inserted:[] deleted:[0] updated:[]")
  }
}
// swiftlint:enable force_try
