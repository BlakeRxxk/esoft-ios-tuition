//
//  RealmRepresentable.swift
//  StorageKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

public protocol RealmRepresentable {
  associatedtype RealmType: EntityConvertibleType
  
  var uuid: String { get }
  
  func asRealm() -> RealmType
}
