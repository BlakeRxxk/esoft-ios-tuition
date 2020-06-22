//
//  PasswordState.swift
//  AuthImplementation#iphonesimulator-x86_64
//
//  Created by nedstar on 19.06.2020.
//

import StateKit
import AuthCore
import EsoftUIKit

public final class LoginState: Store {
  public let initialState: LoginState.State
  
  private let loginUseCase: LoginUseCase
  
  public init(loginUseCase: LoginUseCase) {
    self.loginUseCase = loginUseCase
    
    initialState = State()
  }
}

extension LoginState {
  public struct State: Equatable {
    public var login: String = ""
  }
  
  public enum Action {
    case changeLogin(String)
  }
  
  public enum Mutation {
    case setLogin(String)
  }
  
  public func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case let .changeLogin(login):
      loginUseCase.saveLogin(Login(login: login)) // Правильно ли сохранять при каждом изменении?
      return .just(.setLogin(login))
    }
  }
  
  public func reduce(state: State, mutation: Mutation) -> State {
    var newState = state
    switch mutation {
    case let .setLogin(login):
      newState.login = login
    }
    return newState
  }
}
