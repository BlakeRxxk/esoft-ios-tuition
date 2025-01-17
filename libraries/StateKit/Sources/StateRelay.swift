//
//  StateRelay.swift
//  StateKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import RxSwift

/// StateRelay is a wrapper for `BehaviorSubject`.
///
/// Unlike `BehaviorSubject` it can't terminate with error or completed.
public final class StateRelay<Element>: ObservableType {
  private let _subject: BehaviorSubject<Element>
  /// Gets or sets current value of behavior subject
  ///
  /// Whenever a new value is set, all the observers are notified of the change.
  ///
  /// Even if the newly set value is same as the old value, observers are still notified for change.
  public var value: Element {
    get {
      // this try! is ok because subject can't error out or be disposed
      // swiftlint:disable:next force_try
      return try! _subject.value()
    }
    set(newValue) {
      accept(newValue)
    }
  }
  
  /// Initializes behavior relay with initial value.
  public init(value: Element) {
    _subject = BehaviorSubject(value: value)
  }
  
  /// Subscribes observer
  public func subscribe<O: ObserverType>(_ observer: O) -> Disposable where O.Element == Element {
    _subject.subscribe(observer)
  }
  
  /// - returns: Canonical interface for push style sequence
  public func asObservable() -> Observable<Element> {
    _subject.asObservable()
  }
  
  /// Accepts `event` and emits it to subscribers
  public func accept(_ event: Element) {
    _subject.onNext(event)
  }
}
