//
//  Observable+Ext.swift
//  RealmKit
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation
import RealmSwift
import RxSwift

public extension Observable {
  @available(*, deprecated, renamed: "from(realm:)")
  static func from(_ realm: Realm, scheduler: ImmediateSchedulerType = CurrentThreadScheduler.instance) -> Observable<(Realm, Realm.Notification)> {
    from(realm: realm)
  }
  
  /**
   Returns an `Observable<(Realm, Realm.Notification)>` that emits each time the Realm emits a notification.
   The Observable you will get emits a tuple made out of:
   * the realm that emitted the event
   * the notification type: this can be either `.didChange` which occurs after a refresh or a write transaction ends,
   or `.refreshRequired` which happens when a write transaction occurs from a different thread on the same realm file
   For more information look up: [Realm.Notification](https://realm.io/docs/swift/latest/api/Enums/Notification.html)
   - parameter realm: A Realm instance
   - returns: `Observable<(Realm, Realm.Notification)>`, which you can subscribe to
   */
  static func from(realm: Realm) -> Observable<(Realm, Realm.Notification)> {
    Observable<(Realm, Realm.Notification)>.create { observer in
      let token = realm.observe { (notification: Realm.Notification, realm: Realm) in
        observer.onNext((realm, notification))
      }
      
      return Disposables.create {
        token.invalidate()
      }
    }
  }
}
