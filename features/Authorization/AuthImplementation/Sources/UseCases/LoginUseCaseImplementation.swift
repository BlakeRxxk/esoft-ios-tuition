//
//  LoginUseCaseImplementation.swift
//  AuthImplementation#iphonesimulator-x86_64
//
//  Created by nedstar on 20.06.2020.
//

import RxSwift
import Network
import AuthCore

public final class LoginUseCaseImplementation {
  private var loginRepository: LoginRepository
  
  public init(loginRepository: LoginRepository) {
    self.loginRepository = loginRepository
  }
}

extension LoginUseCaseImplementation: LoginUseCase {
  public func getLogin() -> Observable<Login> {
    loginRepository.getLogin().asObservable()
  }
  
  public func saveLogin(_ login: Login) {
    loginRepository.saveLogin(login)
  }
}
