//
//  SpecialistsListState.swift
//  SpecialistsUI
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import StateKit
import SpecialistsCore
import EsoftUIKit

public final class SpecialistsListState: Store {
  public var scheduler: Scheduler = ConcurrentDispatchQueueScheduler(qos: .userInitiated,
                                                                     leeway: .milliseconds(500))
  public let initialState: SpecialistsListState.State
  private let specialistsUseCase: SpecialistsUseCase
  
  public init(specialistsUseCase: SpecialistsUseCase) {
    self.specialistsUseCase = specialistsUseCase
    
    initialState = State()
  }
}

extension SpecialistsListState {
  
  public struct State: Equatable {
    public var isAuth: Bool = false
    public var initialLoading: Bool = false
    public var isLoading: Bool = false
    public var error: Bool = false
    public var specialists: [SpecialistViewModel] = []
    public var page: Int = 1
    public var pages: Int = 1
    public var scope: SpecialistScope = .all
  }
  
  public enum Action: Equatable {
    case fetchSpecialists(page: Int = 1)
    case refreshMySpecialists
    case empty
  }
  
  public enum Mutation {
    case setInitialLoading(_ condition: Bool = false)
    case setLoading(_ condition: Bool = true)
    case setSpecialists([SpecialistViewModel] = [], pages: Int)
    case appendSpecialists([SpecialistViewModel] = [], pages: Int)
  }

  public func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case .empty:
      return .empty()
    case let .fetchSpecialists(page):
      return Observable.merge([
        .just(.setInitialLoading(page == 1)),
        specialistsUseCase
          .invoke(request: SpecialistsRequest(page: page))
          .map { ($0.0.map { $0.asViewModel() }, $0.1) }
          .map { page > 1 ? .appendSpecialists($0.0, pages: $0.1) : .setSpecialists($0.0, pages: $0.1) }
      ])
    case .refreshMySpecialists:
      return Observable.merge([
        .just(.setInitialLoading(false)),
        .just(.setLoading(true)),
        specialistsUseCase
          .invoke(request: SpecialistsRequest(page: 1))
          .map { ($0.0.map { $0.asViewModel() }, $0.1) }
          .map { .setSpecialists($0.0, pages: $0.1) }
      ])
    }
  }
  
  public func reduce(state: State, mutation: Mutation) -> State {
    switch mutation {
    case let .setSpecialists(specialists, pages):
      var newState = state
      newState.page = 1
      newState.pages = pages
      newState.initialLoading = false
      newState.isLoading = false
      newState.specialists = specialists
      return newState
    case let .appendSpecialists(specialists, pages):
      var newState = state
      newState.page += 1
      newState.pages = pages
      newState.initialLoading = false
      newState.specialists.append(contentsOf: specialists)
      return newState
    case let .setInitialLoading(condition):
      var newState = state
      newState.initialLoading = condition
      return newState
    case let .setLoading(condition):
      var newState = state
      newState.isLoading = condition
      return newState
    }
  }
}
