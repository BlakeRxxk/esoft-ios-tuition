//
//  File.swift
//  RealmKitTests
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation
import RealmSwift
import RealmKit

func realmInMemory(_ name: String = UUID().uuidString) -> Realm {
  var conf = Realm.Configuration()
  conf.inMemoryIdentifier = name
  // swiftlint:disable:next force_try
  return try! Realm(configuration: conf)
}

func stringifyChanges<E>(_ arg: (AnyRealmCollection<E>, RealmChangeset?)) -> String {
  let (result, changes) = arg
  if let changes = changes {
    return "count:\(result.count) inserted:\(changes.inserted) deleted:\(changes.deleted) updated:\(changes.updated)"
  } else {
    return "count:\(result.count)"
  }
}

// MARK: User
class User: Object {
  @objc dynamic var name = ""
  @objc dynamic var lastMessage: Message?
  
  convenience init(_ name: String) {
    self.init()
    self.name = name
  }
}

// MARK: UniqueObject
class UniqueObject: Object {
  @objc dynamic var id = 0
  @objc dynamic var name = ""
  
  convenience init(_ id: Int) {
    self.init()
    self.id = id
  }
  
  override class func primaryKey() -> String? {
    "id"
  }
}

// MARK: Message
class Message: Object {
  @objc dynamic var text = ""
  
  let recipients = List<User>()
  let mentions = LinkingObjects(fromType: User.self, property: "lastMessage")
  
  convenience init(_ text: String) {
    self.init()
    self.text = text
  }
}
