//
//  PasswordState.swift
//  AuthImplementation#iphonesimulator-x86_64
//
//  Created by nedstar on 18.06.2020.
//

import StateKit
import AuthCore
import EsoftUIKit

public final class PasswordState: Store {
  public let initialState: PasswordState.State
  private let passwordUseCase: PasswordUseCase
  
  public init(passwordUseCase: PasswordUseCase) {
    self.passwordUseCase = passwordUseCase
    
    initialState = State()
  }
}

extension PasswordState {
  public struct State: Equatable {
    public var initialLoading: Bool = true
    public var isAvalible: Bool = false
    public var isWaiting: Bool = true
    public var errorMessage: String? = nil
  }
  
  public enum Action {
    case signIn(String)
    case completeInit
  }
  
  public enum Mutation {
    case setInitLoading(Bool)
    case setAvalible(LoginAvalible)
    case setWaiting(Bool)
    case setError(String)
  }
  
  public func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case .completeInit:
      return .just(.setInitLoading(false))
    case let .signIn(password):
      return Observable.merge([
        .just(.setWaiting(true)),
        passwordUseCase.invoke(request: PasswordRequest(password))
          .map { .setAvalible($0) },
        .just(.setWaiting(false))
      ])
    }
  }
  
  public func reduce(state: State, mutation: Mutation) -> State {
    var newState = state
    switch mutation {
    case let .setInitLoading(initialLoading):
      newState.initialLoading = initialLoading
    case let .setAvalible(loginAvalible):
      newState.isAvalible = loginAvalible.result
    case let .setWaiting(isWaiting):
      newState.isWaiting = isWaiting
    case let .setError(errorMessage):
      newState.errorMessage = errorMessage
    }
    return newState
  }
}
