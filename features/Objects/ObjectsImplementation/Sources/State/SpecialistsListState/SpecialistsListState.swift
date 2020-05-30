//
//  SpecialistsListState.swift
//  SpecialistsImplementation
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import StateKit
import ObjectsCore

public final class ObjectsListState: Store {
  public let initialState: ObjectsListState.State
  
  public init() {
    initialState = State()
  }
}

extension ObjectsListState {
  public struct State: Equatable {
    public var isAuth: Bool = false
    public var initialLoading: Bool = false
    public var isLoading: Bool = false
    public var error: Bool = false
    public var objects: [Objects] = []
    public var page: Int = 1
    public var pages: Int = 1
    public var scope: ObjectsScope = .all
  }
  
  public enum Action {
    case refreshMyObjects
  }
  
  public enum Mutation {
    case setError
    case setResult([Objects])
  }

  public func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case .refreshMyObjects:
      return .just(.setError)
    }
  }
  
  public func reduce(state: State, mutation: Mutation) -> State {
    switch mutation {
    case .setError:
      var newState = state
      newState.initialLoading = true
      return newState
    case let .setResult(res):
      var newState = state
      newState.objects = res
      return newState
    }
  }
}
