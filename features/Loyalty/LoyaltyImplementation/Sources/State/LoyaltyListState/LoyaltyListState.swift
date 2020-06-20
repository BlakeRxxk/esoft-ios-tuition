//
//  LoyaltyListState.swift
//  LoyaltyImplementation
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import StateKit
import LoyaltyCore
import EsoftUIKit

public final class LoyaltyListState: Store {
  public let scheduler: Scheduler = ConcurrentDispatchQueueScheduler(qos: .userInitiated, leeway: .milliseconds(500))
  public let initialState: LoyaltyListState.State
  private let loyaltyUseCase: LoyaltyUseCase
  
  public init(loyaltyUseCase: LoyaltyUseCase) {
    self.loyaltyUseCase = loyaltyUseCase
    
    initialState = State()
  }
}

extension LoyaltyListState {
  
  public struct State: Equatable {
    public var isAuth: Bool = false
    public var initialLoading: Bool = false
    public var isLoading: Bool = false
    public var error: Bool = false
    public var loyalty: [DiscountViewModel] = []
    public var scope: LoyaltyScope = .all
  }
  
  public enum Action: Equatable {
    case fetchLoyalty
    case refreshLoyalty
  }
  
  public enum Mutation {
    case setInitialLoading(_ condition: Bool = false)
    case setLoading(_ condition: Bool = true)
    case setLoyalty([DiscountViewModel] = [])
    case appendLoyalty([DiscountViewModel] = [])
  }
  
  public func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case let .fetchLoyalty:
      return Observable.merge([
        .just(.setInitialLoading()),
        loyaltyUseCase
          .invoke(request: LoyaltyRequest())
          .map { ($0.map { $0.asViewModel() }) }
          .map { .setLoyalty($0) }
      ])
    case .refreshLoyalty:
      return Observable.merge([
        .just(.setInitialLoading(false)),
        .just(.setLoading(true)),
        loyaltyUseCase
          .invoke(request: LoyaltyRequest())
          .map { ($0.map { $0.asViewModel() }) }
          .map { .setLoyalty($0) }
      ])
    }
  }
  
  public func reduce(state: State, mutation: Mutation) -> State {
    switch mutation {
    case let .setLoyalty(loyalty):
      var newState = state
      newState.initialLoading = false
      newState.isLoading = false
      newState.loyalty = loyalty
      return newState
    case let .appendLoyalty(loyalty):
      var newState = state
      newState.initialLoading = false
      newState.loyalty.append(contentsOf: loyalty)
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
