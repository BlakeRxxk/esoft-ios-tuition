//
//  NotificationEmitter+Rx.swift
//  RealmKit
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation
import RealmSwift
import RxSwift

/**
 `RealmChangeset` is a struct that contains the data about a single realm change set.
 It includes the insertions, modifications, and deletions indexes in the data set that the current notification is about.
 */
public struct RealmChangeset {
  /// the indexes in the collection that were deleted
  public let deleted: [Int]
  
  /// the indexes in the collection that were inserted
  public let inserted: [Int]
  
  /// the indexes in the collection that were modified
  public let updated: [Int]
}

public extension ObservableType where Element: NotificationEmitter {
  @available(*, deprecated, renamed: "collection(from:synchronousStart:)")
  static func from(_ collection: Element, scheduler: ImmediateSchedulerType = CurrentThreadScheduler.instance) -> Observable<Element> {
    self.collection(from: collection)
  }
  
  /**
   Returns an `Observable<Element>` that emits each time the collection data changes.
   The observable emits an initial value upon subscription.
   - parameter from: A Realm collection of type `Element`: either `Results`, `List`, `LinkingObjects` or `AnyRealmCollection`.
   - parameter synchronousStart: whether the resulting `Observable` should emit its first element synchronously (e.g. better for UI bindings)
   - parameter queue: The serial dispatch queue to receive notification on. If `nil`, notifications are delivered to the current thread.
   - returns: `Observable<Element>`, e.g. when called on `Results<Model>` it will return `Observable<Results<Model>>`,
    on a `List<User>` it will return `Observable<List<User>>`, etc.
   */
  static func collection(from collection: Element, synchronousStart: Bool = true, on queue: DispatchQueue? = nil)
    -> Observable<Element> {
      Observable.create { observer in
        if synchronousStart {
          observer.onNext(collection)
        }
        
        let token = collection.observe(on: queue) { changeset in
          
          let value: Element
          
          switch changeset {
          case let .initial(latestValue):
            guard !synchronousStart else { return }
            value = latestValue
            
          case .update(let latestValue, _, _, _):
            value = latestValue
            
          case let .error(error):
            observer.onError(error)
            return
          }
          
          observer.onNext(value)
        }
        
        return Disposables.create {
          token.invalidate()
        }
      }
  }
  
  @available(*, deprecated, renamed: "array(from:synchronousStart:)")
  static func arrayFrom(_ collection: Element, scheduler: ImmediateSchedulerType = CurrentThreadScheduler.instance) -> Observable<[Element.ElementType]> {
    array(from: collection)
  }
  
  /**
   Returns an `Observable<Array<Element.Element>>` that emits each time the collection data changes. The observable emits an initial value upon subscription.
   The result emits an array containing all objects from the source collection.
   - parameter from: A Realm collection of type `Element`: either `Results`, `List`, `LinkingObjects` or `AnyRealmCollection`.
   - parameter synchronousStart: whether the resulting Observable should emit its first element synchronously (e.g. better for UI bindings)
   - parameter queue: The serial dispatch queue to receive notification on. If `nil`, notifications are delivered to the current thread.
   - returns: `Observable<Array<Element.Element>>`, e.g. when called on `Results<Model>` it will return
   `Observable<Array<Model>>`, on a `List<User>` it will return `Observable<Array<User>>`, etc.
   */
  static func array(from collection: Element, synchronousStart: Bool = true, on queue: DispatchQueue? = nil)
    -> Observable<[Element.ElementType]> {
      Observable.collection(from: collection, synchronousStart: synchronousStart, on: queue)
        .map { $0.toArray() }
  }
  
  @available(*, deprecated, renamed: "changeset(from:synchronousStart:)")
  static func changesetFrom(
    _ collection: Element,
    scheduler: ImmediateSchedulerType = CurrentThreadScheduler.instance
  ) -> Observable<(AnyRealmCollection<Element.ElementType>, RealmChangeset?)> {
    changeset(from: collection)
  }
  
  /**
   Returns an `Observable<(Element, RealmChangeset?)>` that emits each time the collection data changes.
   The observable emits an initial value upon subscription.
   When the observable emits for the first time (if the initial notification is not coalesced with an update) the second tuple value will be `nil`.
   Each following emit will include a `RealmChangeset` with the indexes inserted, deleted or modified.
   - parameter from: A Realm collection of type `Element`: either `Results`, `List`, `LinkingObjects` or `AnyRealmCollection`.
   - parameter synchronousStart: whether the resulting Observable should emit its first element synchronously (e.g. better for UI bindings)
   - parameter queue: The serial dispatch queue to receive notification on. If `nil`, notifications are delivered to the current thread.
   - returns: `Observable<(AnyRealmCollection<Element.Element>, RealmChangeset?)>`
   */
  static func changeset(from collection: Element, synchronousStart: Bool = true, on queue: DispatchQueue? = nil)
    -> Observable<(AnyRealmCollection<Element.ElementType>, RealmChangeset?)> {
      Observable.create { observer in
        if synchronousStart {
          observer.onNext((collection.toAnyCollection(), nil))
        }
        
        let token = collection.toAnyCollection().observe(on: queue) { changeset in
          
          switch changeset {
          case let .initial(value):
            guard !synchronousStart else { return }
            observer.onNext((value, nil))
          case let .update(value, deletes, inserts, updates):
            observer.onNext((value, RealmChangeset(deleted: deletes, inserted: inserts, updated: updates)))
          case let .error(error):
            observer.onError(error)
            return
          }
        }
        
        return Disposables.create {
          token.invalidate()
        }
      }
  }
  
  @available(*, deprecated, renamed: "arrayWithChangeset(from:synchronousStart:)")
  static func changesetArrayFrom(
    _ collection: Element,
    scheduler: ImmediateSchedulerType = CurrentThreadScheduler.instance
  ) -> Observable<([Element.ElementType], RealmChangeset?)> {
    arrayWithChangeset(from: collection)
  }
  
  /**
   Returns an `Observable<(Array<Element.Element>, RealmChangeset?)>` that emits each time the collection data changes.
   The observable emits an initial value upon subscription.
   This method emits an `Array` containing all the realm collection objects, this means they all live in the memory.
   If you're using this method to observe large collections you might hit memory warnings.
   When the observable emits for the first time (if the initial notification is not coalesced with an update) the second tuple value will be `nil`.
   Each following emit will include a `RealmChangeset` with the indexes inserted, deleted or modified.
   - parameter from: A Realm collection of type `Element`: either `Results`, `List`, `LinkingObjects` or `AnyRealmCollection`.
   - parameter synchronousStart: whether the resulting Observable should emit its first element synchronously (e.g. better for UI bindings)
   - parameter queue: The serial dispatch queue to receive notification on. If `nil`, notifications are delivered to the current thread.
   - returns: `Observable<(Array<Element.Element>, RealmChangeset?)>`
   */
  static func arrayWithChangeset(from collection: Element, synchronousStart: Bool = true, on queue: DispatchQueue? = nil)
    -> Observable<([Element.ElementType], RealmChangeset?)> {
      Observable.changeset(from: collection, on: queue)
        .map { ($0.toArray(), $1) }
  }
}
