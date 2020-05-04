//
//  Store.swift
//  StateKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import RxSwift

@available(*, obsoleted: 0, renamed: "Never")
public typealias NoAction = Never

@available(*, obsoleted: 0, renamed: "Never")
public typealias NoMutation = Never

/// A Store is an UI-independent layer which manages the state of a view. The foremost role of a
/// reactor is to separate control flow from a view. Every view has its corresponding reactor and
/// delegates all logic to its reactor. A reactor has no dependency to a view, so it can be easily
/// tested.
public protocol Store: class {
  /// An action represents user actions.
  associatedtype Action
  
  /// A mutation represents state changes.
  associatedtype Mutation = Action
  
  /// A State represents the current state of a view.
  associatedtype State
  
  typealias Scheduler = ImmediateSchedulerType
  
  /// The action from the view. Bind user inputs to this subject.
  var action: ActionSubject<Action> { get }
  
  /// The initial state.
  var initialState: State { get }
  
  /// The current state. This value is changed just after the state stream emits a new state.
  var currentState: State { get }
  
  /// The state stream. Use this observable to observe the state changes.
  var state: Observable<State> { get }
  
  /// A scheduler for reducing and observing the state stream. Defaults to `CurrentThreadScheduler`.
  var scheduler: Scheduler { get }
  
  /// Transforms the action. Use this function to combine with other observables. This method is
  /// called once before the state stream is created.
  func transform(action: Observable<Action>) -> Observable<Action>
  
  /// Commits mutation from the action. This is the best place to perform side-effects such as
  /// async tasks.
  func mutate(action: Action) -> Observable<Mutation>
  
  /// Transforms the mutation stream. Implement this method to transform or combine with other
  /// observables. This method is called once before the state stream is created.
  func transform(mutation: Observable<Mutation>) -> Observable<Mutation>
  
  /// Generates a new state with the previous state and the action. It should be purely functional
  /// so it should not perform any side-effects here. This method is called every time when the
  /// mutation is committed.
  func reduce(state: State, mutation: Mutation) -> State
  
  /// Transforms the state stream. Use this function to perform side-effects such as logging. This
  /// method is called once after the state stream is created.
  func transform(state: Observable<State>) -> Observable<State>
}
