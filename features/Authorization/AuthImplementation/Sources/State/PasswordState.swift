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
  
  private let loginUseCase: LoginUseCase
  private let passwordUseCase: PasswordUseCase
  
  public init(loginUseCase: LoginUseCase,
              passwordUseCase: PasswordUseCase) {
    self.loginUseCase = loginUseCase
    self.passwordUseCase = passwordUseCase
    
    initialState = State()
  }
}

extension PasswordState {
  public struct State: Equatable {
    public var isAvailable: Bool = false
    public var isWaiting: Bool = false
    public var password: String = ""
    public var errorMessage: String?
  }
  
  public enum Action {
    case changePassword(String)
    case signIn
  }
  
  public enum Mutation {
    case setWaiting(Bool)
    case setPasswrod(String)
    case setAvailable(LoginAvailable)
    case setError(String)
  }
  
  public func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case let .changePassword(password):
//      loginUseCase.getLogin().do(onNext: { login in
//        print(login.login)
//        }).debug()
      return .just(.setPasswrod(password))
    case let .signIn:
      return Observable.merge([
        .just(.setWaiting(true)),
        passwordUseCase
          .invoke(request: PasswordRequest(currentState.password))
//          .delay(.seconds(5), scheduler: MainScheduler.instance)
          .materialize()
          .flatMap { e -> Observable<Mutation> in
            if let error = e.error as? NSError {
              return .just(.setError(error.domain))
            }
            switch e.event {
            case let .next(loginAvailable):
              
              if loginAvailable.result {
                return .just(.setAvailable(loginAvailable))
              }
              return .just(.setError("Введен неверный пароль")) // куда это переместить? или оставить здесь?
            default:
              return .just(.setWaiting(false))
            }
          }
      ])
    }
  }
  
  public func reduce(state: State, mutation: Mutation) -> State {
    var newState = state
    switch mutation {
    case let .setWaiting(isWaiting):
      newState.isWaiting = isWaiting
    case let .setPasswrod(password):
      newState.password = password
      newState.isAvailable = false
    case let .setAvailable(loginAvailable):
      newState.isAvailable = loginAvailable.result
      newState.isWaiting = false
    case let .setError(errorMessage):
      newState.errorMessage = errorMessage
      newState.password = ""
      newState.isWaiting = false
    }
    return newState
  }
}
