//
//  StatefullView.swift
//  StateKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import RxSwift

/// A View displays data. A view controller and a cell are treated as a view. The view binds user
/// inputs to the action stream and binds the view states to each UI component. There's no business
/// logic in a view layer. A view just defines how to map the action stream and the state stream.
public protocol StatefullView: class {
  associatedtype Store: StateKit.Store
  
  /// A dispose bag. It is disposed each time the `reactor` is assigned.
  var disposeBag: DisposeBag { get set }
  
  /// A view's store. `bind(store:)` gets called when the new value is assigned to this property.
  var store: Store? { get set }
  
  /// Creates RxSwift bindings. This method is called each time the `reactor` is assigned.
  ///
  /// Here is a typical implementation example:
  ///
  /// ```
  /// func bind(store: MyStore) {
  ///   // Action
  ///   increaseButton.rx.tap
  ///     .bind(to: Store.Action.increase)
  ///     .disposed(by: disposeBag)
  ///
  ///   // State
  ///   store.state.map { $0.count }
  ///     .bind(to: countLabel.rx.text)
  ///     .disposed(by: disposeBag)
  /// }
  /// ```
  ///
  /// - warning: It's not recommended to call this method directly.
  func bind(store: Store)
}

// MARK: - Associated Object Keys
var storeKey = "store"
var isStoreBindedKey = "isStoreBinded"
