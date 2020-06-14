//
//  Realm+Rx.swift
//  StorageKit#iphonesimulator-x86_64
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation
import RxSwift
import Realm
import RealmSwift
import RealmKit

extension Reactive where Base == Realm {
  func save<T: RealmRepresentable>(entity: T, update: Bool = true) -> Observable<Void> where T.RealmType: Object {
    Observable.create { observer in
      do {
        try self.base.write {
          self.base.add(entity.asRealm(), update: .modified)
          observer.onCompleted()
        }
      } catch {
        observer.onError(error)
      }
      return Disposables.create()
    }
  }
  
  func save<T: RealmRepresentable>(entities: [T], update: Bool = true) -> Observable<Void> where T.RealmType: Object {
    Observable.create { observer in
      do {
        try self.base.write {
          for entity in entities {
            self.base.add(entity.asRealm(), update: .modified)
            observer.onCompleted()
          }
        }
      } catch {
        observer.onError(error)
      }
      return Disposables.create()
    }
  }
  
  func delete<T: RealmRepresentable>(entity: T) -> Observable<Void> where T.RealmType: Object {
    Observable.create { observer in
      do {
        guard let object = self.base.object(ofType: T.RealmType.self, forPrimaryKey: entity.uuid) else {
          throw NSError(domain: "Realm delete error", code: 404, userInfo: nil)}
        
        try self.base.write {
          self.base.delete(object)
          observer.onCompleted()
        }
        
      } catch {
        observer.onError(error)
      }
      return Disposables.create()
    }
  }
}
