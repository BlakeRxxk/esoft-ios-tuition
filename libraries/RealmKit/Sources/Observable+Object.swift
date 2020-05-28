//
//  Observable+Object.swift
//  RealmKit
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation
import RealmSwift
import RxSwift

// MARK: Realm Object type extensions
public extension Observable where Element: Object {
  @available(*, deprecated, renamed: "from(object:)")
  static func from(_ object: Element) -> Observable<Element> {
    from(object: object)
  }
  
  /**
   Returns an `Observable<Object>` that emits each time the object changes. The observable emits an initial value upon subscription.
   - parameter object: A Realm Object to observe
   - parameter emitInitialValue: whether the resulting `Observable` should emit its first element synchronously (e.g. better for UI bindings)
   - parameter properties: changes to which properties would triger emitting a .next event
   - returns: `Observable<Object>` will emit any time the observed object changes + one initial emit upon subscription
   */
  
  static func from(object: Element, emitInitialValue: Bool = true,
                   properties: [String]? = nil) -> Observable<Element> {
    Observable<Element>.create { observer in
      if emitInitialValue {
        observer.onNext(object)
      }
      
      let token = object.observe { change in
        switch change {
        case let .change(_, changedProperties):
          if let properties = properties, !changedProperties.contains(where: { properties.contains($0.name) }) {
            // if change property isn't an observed one, just return
            return
          }
          observer.onNext(object)
        case .deleted:
          observer.onError(RxRealmError.objectDeleted)
        case let .error(error):
          observer.onError(error)
        }
      }
      
      return Disposables.create {
        token.invalidate()
      }
    }
  }
  
  /**
   Returns an `Observable<PropertyChange>` that emits the object `PropertyChange`s.
   - parameter object: A Realm Object to observe
   - returns: `Observable<PropertyChange>` will emit any time a change is detected on the object
   */
  
  static func propertyChanges(object: Element) -> Observable<PropertyChange> {
    Observable<PropertyChange>.create { observer in
      let token = object.observe { change in
        switch change {
        case let .change(_, changes):
          for change in changes {
            observer.onNext(change)
          }
        case .deleted:
          observer.onError(RxRealmError.objectDeleted)
        case let .error(error):
          observer.onError(error)
        }
      }
      
      return Disposables.create {
        token.invalidate()
      }
    }
  }
}
