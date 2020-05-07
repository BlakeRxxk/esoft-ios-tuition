//
//  Store+Default.swift
//  StateKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation

extension Store {
  private var _action: ActionSubject<Action> {
    if self.isStubEnabled {
      return self.stub.action
    } else {
      return MapTables.action.forceCastedValue(forKey: self, default: .init())
    }
  }
  public var action: ActionSubject<Action> {
    // Creates a state stream automatically
    _ = self._state
    
    // It seems that Swift has a bug in associated object when subclassing a generic class. This is
    // a temporary solution to bypass the bug. See #30 for details.
    return self._action
  }
  
  public internal(set) var currentState: State {
    get { MapTables.currentState.forceCastedValue(forKey: self, default: self.initialState) }
    set { MapTables.currentState.setValue(newValue, forKey: self) }
  }
  
  private var _state: Observable<State> {
    if self.isStubEnabled {
      return self.stub.state.asObservable()
    } else {
      return MapTables.state.forceCastedValue(forKey: self, default: self.createStateStream())
    }
  }
  public var state: Observable<State> {
    // It seems that Swift has a bug in associated object when subclassing a generic class. This is
    // a temporary solution to bypass the bug. See #30 for details.
    return self._state
  }
  
  public var scheduler: Scheduler {
    CurrentThreadScheduler.instance
  }
  
  internal var disposeBag: DisposeBag {
    MapTables.disposeBag.value(forKey: self, default: DisposeBag())
  }
  
  public func createStateStream() -> Observable<State> {
    let action = self._action.observeOn(self.scheduler)
    let transformedAction = self.transform(action: action)
    let mutation = transformedAction
      .flatMap { [weak self] action -> Observable<Mutation> in
        guard let `self` = self else { return .empty() }
        return self.mutate(action: action).catchError { _ in .empty() }
    }
    let transformedMutation = self.transform(mutation: mutation)
    let state = transformedMutation
      .scan(self.initialState) { [weak self] state, mutation -> State in
        guard let `self` = self else { return state }
        return self.reduce(state: state, mutation: mutation)
    }
    .catchError { _ in .empty() }
    .startWith(self.initialState)
    let transformedState = self.transform(state: state)
      .do(onNext: { [weak self] state in
        self?.currentState = state
      })
      .replay(1)
    transformedState.connect().disposed(by: self.disposeBag)
    return transformedState.observeOn(self.scheduler)
  }
  
  public func transform(action: Observable<Action>) -> Observable<Action> {
    action
  }
  
  public func mutate(action: Action) -> Observable<Mutation> {
    .empty()
  }
  
  public func transform(mutation: Observable<Mutation>) -> Observable<Mutation> {
    mutation
  }
  
  public func reduce(state: State, mutation: Mutation) -> State {
    state
  }
  
  public func transform(state: Observable<State>) -> Observable<State> {
    state
  }
}

extension Store where Action == Mutation {
  public func mutate(action: Action) -> Observable<Mutation> {
    .just(action)
  }
}
