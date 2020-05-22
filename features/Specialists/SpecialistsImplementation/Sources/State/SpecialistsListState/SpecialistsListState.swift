//
//  SpecialistsListState.swift
//  SpecialistsImplementation
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import StateKit
import SpecialistsCore

public final class SpecialistsListState: Store {
  public let initialState: SpecialistsListState.State
  private let useCase: SpecialistsUseCase
  
  public init(useCase: SpecialistsUseCase) {
    self.useCase = useCase

    initialState = State()
  }
}

extension SpecialistsListState {
  public struct State: Equatable {
    public var isAuth: Bool = false
    public var initialLoading: Bool = false
    public var isLoading: Bool = false
    public var error: Bool = false
    public var specialists: [Specialist] = []
    public var page: Int = 1
    public var pages: Int = 1
    public var scope: SpecialistScope = .all
  }
  
  public enum Action {
    case refreshMySpecialists
  }
  
  public enum Mutation {
    case setError
    case setResult([Specialist])
  }

  public func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case .refreshMySpecialists:
      return useCase.invoke(request: SpecialistsRequest(page: 1)).map { .setResult($0) }
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
      newState.specialists = res
      return newState
    }
  }
}
