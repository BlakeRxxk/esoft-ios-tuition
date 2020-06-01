//
//  Realm+Rx.swift
//  RealmKit
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation
import RealmSwift
import RxSwift

// MARK: Realm type extensions
extension Realm: ReactiveCompatible {}

extension Reactive where Base == Realm {
  /**
   Returns bindable sink wich adds object sequence to the current Realm
   - parameter: update - update according to Realm.UpdatePolicy
   - parameter: onError - closure to implement custom error handling
   - returns: `AnyObserver<S>`, which you can use to subscribe an `Observable` to
   */
  public func add<S: Sequence>(update: Realm.UpdatePolicy = .error, onError: ((S?, Error) -> Void)? = nil)
    -> AnyObserver<S> where S.Iterator.Element: Object {
      RealmObserver(realm: base) { realm, elements, error in
        guard let realm = realm else {
          onError?(nil, error ?? RxRealmError.unknown)
          return
        }
        
        do {
          try realm.write {
            realm.add(elements, update: update)
          }
        } catch let e {
          onError?(elements, e)
        }
      }
      .asObserver()
  }
  
  /**
   Returns bindable sink wich adds an object to Realm
   - parameter: update - update according to Realm.UpdatePolicy
   - parameter: onError - closure to implement custom error handling
   - returns: `AnyObserver<O>`, which you can use to subscribe an `Observable` to
   */
  public func add<O: Object>(update: Realm.UpdatePolicy = .error,
                             onError: ((O?, Error) -> Void)? = nil) -> AnyObserver<O> {
    RealmObserver(realm: base) { realm, element, error in
      guard let realm = realm else {
        onError?(nil, error ?? RxRealmError.unknown)
        return
      }
      
      do {
        try realm.write {
          realm.add(element, update: update)
        }
      } catch let e {
        onError?(element, e)
      }
    }.asObserver()
  }
  
  /**
   Returns bindable sink wich deletes objects in sequence from Realm.
   - parameter: onError - closure to implement custom error handling
   - returns: `AnyObserver<S>`, which you can use to subscribe an `Observable` to
   */
  public func delete<S: Sequence>(onError: ((S?, Error) -> Void)? = nil)
    -> AnyObserver<S> where S.Iterator.Element: Object {
      RealmObserver(realm: base, binding: { realm, elements, error in
        guard let realm = realm else {
          onError?(nil, error ?? RxRealmError.unknown)
          return
        }
        
        do {
          try realm.write {
            realm.delete(elements)
          }
        } catch let e {
          onError?(elements, e)
        }
      }).asObserver()
  }
  
  /**
   Returns bindable sink wich deletes objects in sequence from Realm.
   - parameter: onError - closure to implement custom error handling
   - returns: `AnyObserver<O>`, which you can use to subscribe an `Observable` to
   */
  public func delete<O: Object>(onError: ((O?, Error) -> Void)? = nil) -> AnyObserver<O> {
    RealmObserver(realm: base, binding: { realm, element, error in
      guard let realm = realm else {
        onError?(nil, error ?? RxRealmError.unknown)
        return
      }
      
      do {
        try realm.write {
          realm.delete(element)
        }
      } catch let e {
        onError?(element, e)
      }
    }).asObserver()
  }
}

extension Reactive where Base == Realm {
  /**
   Returns bindable sink wich adds object sequence to a Realm
   - parameter: configuration (by default uses `Realm.Configuration.defaultConfiguration`)
   to use to get a Realm for the write operations
   - parameter: update - update according to Realm.UpdatePolicy
   - parameter: onError - closure to implement custom error handling
   - returns: `AnyObserver<S>`, which you can use to subscribe an `Observable` to
   */
  public static func add<S: Sequence>(configuration: Realm.Configuration = Realm.Configuration.defaultConfiguration,
                                      update: Realm.UpdatePolicy = .error,
                                      onError: ((S?, Error) -> Void)? = nil) -> AnyObserver<S> where S.Iterator.Element: Object {
    RealmObserver(configuration: configuration) { realm, elements, error in
      guard let realm = realm else {
        onError?(nil, error ?? RxRealmError.unknown)
        return
      }
      
      do {
        try realm.write {
          realm.add(elements, update: update)
        }
      } catch let e {
        onError?(elements, e)
      }
    }.asObserver()
  }
  
  /**
   Returns bindable sink which adds an object to a Realm
   - parameter: configuration (by default uses `Realm.Configuration.defaultConfiguration`)
   to use to get a Realm for the write operations
   - parameter: update - update according to Realm.UpdatePolicy
   - parameter: onError - closure to implement custom error handling
   - returns: `AnyObserver<O>`, which you can use to subscribe an `Observable` to
   */
  public static func add<O: Object>(configuration: Realm.Configuration = Realm.Configuration.defaultConfiguration,
                                    update: Realm.UpdatePolicy = .error,
                                    onError: ((O?, Error) -> Void)? = nil) -> AnyObserver<O> {
    RealmObserver(configuration: configuration) { realm, element, error in
      guard let realm = realm else {
        onError?(nil, error ?? RxRealmError.unknown)
        return
      }
      
      do {
        try realm.write {
          realm.add(element, update: update)
        }
      } catch let e {
        onError?(element, e)
      }
    }.asObserver()
  }
  
  /**
   Returns bindable sink, which deletes objects in sequence from Realm.
   - parameter: onError - closure to implement custom error handling
   - returns: `AnyObserver<S>`, which you can use to subscribe an `Observable` to
   */
  public static func delete<S: Sequence>(onError: ((S?, Error) -> Void)? = nil)
    -> AnyObserver<S> where S.Iterator.Element: Object {
      AnyObserver { event in
        
        guard let elements = event.element,
          var generator = elements.makeIterator() as S.Iterator?,
          let first = generator.next(),
          let realm = first.realm else {
            onError?(nil, RxRealmError.unknown)
            return
        }
        
        do {
          try realm.write {
            realm.delete(elements)
          }
        } catch let e {
          onError?(elements, e)
        }
      }
  }
  
  /**
   Returns bindable sink, which deletes object from Realm
   - parameter: onError - closure to implement custom error handling
   - returns: `AnyObserver<O>`, which you can use to subscribe an `Observable` to
   */
  public static func delete<O: Object>(onError: ((O?, Error) -> Void)? = nil) -> AnyObserver<O> {
    AnyObserver { event in
      
      guard let element = event.element, let realm = element.realm else {
        onError?(nil, RxRealmError.unknown)
        return
      }
      
      do {
        try realm.write {
          realm.delete(element)
        }
      } catch let e {
        onError?(element, e)
      }
    }
  }
}
