//
//  StatefullView+Default.swift
//  StateKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import RxSwift

private typealias AnyStatefullView = AnyObject

private enum ViewMapTables {
  static let store = WeakMapTable<AnyStatefullView, Any>()
}

extension StatefullView {
  public var store: Store? {
    get { ViewMapTables.store.value(forKey: self) as? Store }
    set {
      ViewMapTables.store.setValue(newValue, forKey: self)
      self.disposeBag = DisposeBag()
      if let reactor = newValue {
        self.bind(store: reactor)
      }
    }
  }
}
