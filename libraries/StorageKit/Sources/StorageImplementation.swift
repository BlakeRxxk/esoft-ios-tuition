//
//  StorageImplementation.swift
//  StorageKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Realm
import RealmSwift
import RealmKit
import RxSwift

open class StorageImplementation<T: RealmRepresentable>: Storage where T == T.RealmType.EntityType, T.RealmType: Object {
  private let scheduler: StorageScheduler
  private let configuration: Realm.Configuration
  
  private lazy var realm: Realm = {
    // swiftlint:disable:next force_try
    return try! Realm(configuration: configuration)
  }()
  
  public init(configuration: Realm.Configuration) {
    self.scheduler = StorageScheduler(threadName: "com.esoft.storage.realm")
    self.configuration = configuration
  }
  
  open func query() -> Observable<[T]> {
    Observable
      .deferred { [weak self] in
        let objects = self?.realm.objects(T.RealmType.self)
        guard let realmObjects = objects else {
          return .empty()
        }
        return Observable.array(from: realmObjects).mapToEntity()
    }
    .subscribeOn(scheduler)
  }
  
  open func query(with predicate: NSPredicate, sort sortDescriptors: [NSSortDescriptor] = []) -> Observable<[T]> {
    Observable
      .deferred { [weak self] in
        let objects = self?.realm
          .objects(T.RealmType.self)
          .filter(predicate)
          .sorted(by: sortDescriptors.map(SortDescriptor.init))
        guard let realmObjects = objects else {
          return .empty()
        }
        return Observable.array(from: realmObjects).mapToEntity()
    }
    .subscribeOn(scheduler)
  }
  
  open func query(sort sortDescriptors: [NSSortDescriptor] = []) -> Observable<[T]> {
    Observable
      .deferred { [weak self] in
        let objects = self?.realm
          .objects(T.RealmType.self)
          .sorted(by: sortDescriptors.map(SortDescriptor.init))
        guard let realmObjects = objects else {
          return .empty()
        }
        return Observable.array(from: realmObjects).mapToEntity()
    }
    .subscribeOn(scheduler)
  }
  
  open func save(entity: T, updateAllow: Bool = false) -> Completable {
    Observable
      .deferred { [weak self] in
        self?.realm.rx.save(entity: entity, update: updateAllow) ?? .empty()
    }
    .subscribeOn(scheduler)
    .ignoreElements()
  }
  
  open func save(entities: [T]) -> Completable {
    Observable
      .deferred { [weak self] in
        self?.realm.rx.save(entities: entities) ?? .empty()
    }
    .subscribeOn(scheduler)
    .ignoreElements()
  }
  
  open func save(entities: [T], updateAllow: Bool = false) -> Completable {
    Observable
      .deferred { [weak self] in
        self?.realm.rx.save(entities: entities, update: updateAllow) ?? .empty()
    }
    .subscribeOn(scheduler)
    .ignoreElements()
  }
  
  open func delete(entity: T) -> Completable {
    Observable
      .deferred { [weak self] in
        self?.realm.rx.delete(entity: entity) ?? .empty()
    }
    .subscribeOn(scheduler)
    .ignoreElements()
  }
  
  open func deleteAll() -> Completable {
    Observable<Any>.create { [weak self] observer in
      let allObjects = self?.realm.objects(T.RealmType.self)
      if let realmObjects = allObjects {
        do {
          try self?.realm.write {
            self?.realm.delete(realmObjects)
          }
        } catch {
          observer.onError(NSError(domain: "Realm erase eror", code: 404, userInfo: nil))
        }
        observer.onCompleted()
      }
      return Disposables.create()
    }
    .subscribeOn(scheduler)
    .ignoreElements()
  }
}
