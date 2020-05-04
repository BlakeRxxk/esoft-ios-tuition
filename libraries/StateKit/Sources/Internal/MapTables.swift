//
//  MapTables.swift
//  StateKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation

internal typealias AnyStore = AnyObject

internal enum MapTables {
  static let action = WeakMapTable<AnyStore, AnyObject>()
  static let currentState = WeakMapTable<AnyStore, Any>()
  static let state = WeakMapTable<AnyStore, AnyObject>()
  static let disposeBag = WeakMapTable<AnyStore, DisposeBag>()
  static let isStubEnabled = WeakMapTable<AnyStore, Bool>()
  static let stub = WeakMapTable<AnyStore, AnyObject>()
}
