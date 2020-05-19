//
//  SpecialistsListState.swift
//  SpecialistsImplementation
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import StateKit

public final class SpecialistsListState: Store {
  
  public let initialState: SpecialistsListState.State
  
  public init() {
    
    initialState = State()
  }
}

extension SpecialistsListState {
  public struct State: Equatable {
    public var initialLoading: Bool = false
  }
  
  public enum Action {
    case refreshMySpecialists
  }
  
  public enum Mutation {
    case setError
  }
  
  public func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case .refreshMySpecialists:
      return .just(.setError)
    }
  }
  
  public func reduce(state: State, mutation: Mutation) -> State {
    switch mutation {
    case .setError:
      var newState = state
      newState.initialLoading = true
      return newState
    }
  }
}
