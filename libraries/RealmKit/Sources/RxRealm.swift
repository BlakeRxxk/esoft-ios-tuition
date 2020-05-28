//
//  RxRealm.swift
//  RealmKit
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation
import RealmSwift
import RxSwift

// MARK: Realm Collections type extensions
/**
 `NotificationEmitter` is a protocol to allow for Realm's collections to be handled in a generic way.
 All collections already include a `addNotificationBlock(_:)` method - making them conform to
 `NotificationEmitter` just makes it easier to add Rx methods to them.
 The methods of essence in this protocol are `asObservable(...)`, which allow for observing for
 changes on Realm's collections.
 */
public protocol NotificationEmitter {
  associatedtype ElementType: RealmCollectionValue
  
  /**
   Returns a `NotificationToken`, which while retained enables change notifications for the current collection.
   - returns: `NotificationToken` - retain this value to keep notifications being emitted for the current collection.
   */
  func observe(on queue: DispatchQueue?,
               _ block: @escaping (RealmCollectionChange<Self>) -> Void) -> NotificationToken
  
  func toArray() -> [ElementType]
  
  func toAnyCollection() -> AnyRealmCollection<ElementType>
}

extension List: NotificationEmitter {
  public typealias ElementType = Element
  
  public func toAnyCollection() -> AnyRealmCollection<Element> {
    AnyRealmCollection<Element>(self)
  }
  
  public func toArray() -> [Element] {
    Array(self)
  }
}

extension AnyRealmCollection: NotificationEmitter {
  public typealias ElementType = Element
  
  public func toAnyCollection() -> AnyRealmCollection<Element> {
    AnyRealmCollection<ElementType>(self)
  }
  
  public func toArray() -> [Element] {
    Array(self)
  }
}

extension Results: NotificationEmitter {
  public typealias ElementType = Element
  
  public func toAnyCollection() -> AnyRealmCollection<Element> {
    AnyRealmCollection<ElementType>(self)
  }
  
  public func toArray() -> [Element] {
    Array(self)
  }
}

extension LinkingObjects: NotificationEmitter {
  public typealias ElementType = Element
  
  public func toAnyCollection() -> AnyRealmCollection<Element> {
    AnyRealmCollection<ElementType>(self)
  }
  
  public func toArray() -> [Element] {
    Array(self)
  }
}
