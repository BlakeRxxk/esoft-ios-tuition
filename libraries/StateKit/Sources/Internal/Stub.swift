//
//  Stub.swift
//  StateKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import RxSwift

public class Stub<StoreType: Store> {
  private unowned var store: StoreType
  private let disposeBag: DisposeBag
  
  @available(*, deprecated, message: "Use 'Store.isStubEnabled' instead.")
  public var isEnabled: Bool {
    set { self.store.isStubEnabled = newValue }
    get { self.store.isStubEnabled }
  }
  
  public let state: StateRelay<StoreType.State>
  public let action: ActionSubject<StoreType.Action>
  public private(set) var actions: [StoreType.Action] = []
  
  public init(store: StoreType, disposeBag: DisposeBag) {
    self.store = store
    self.disposeBag = disposeBag
    self.state = .init(value: store.initialState)
    self.state.asObservable()
      .subscribe(onNext: { [weak store] state in
        store?.currentState = state
      })
      .disposed(by: disposeBag)
    self.action = .init()
    self.action
      .subscribe(onNext: { [weak self] action in
        self?.actions.append(action)
      })
      .disposed(by: self.disposeBag)
  }
}
