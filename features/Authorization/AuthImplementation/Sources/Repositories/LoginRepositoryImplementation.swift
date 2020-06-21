//
//  LoginRepositoryImplementation.swift
//  AuthImplementation#iphonesimulator-x86_64
//
//  Created by nedstar on 20.06.2020.
//

import RxSwift
import Network
import AuthCore

public final class LoginRepositoryImplementation {
  private var loginStorage: LoginStorage

  public init(loginStorage: LoginStorage) {
    self.loginStorage = loginStorage
  }
}

extension LoginRepositoryImplementation: LoginRepository {
  public func getLogin() -> Single<Login> {
    loginStorage.fetchLogin()
  }
  
  public func saveLogin(_ login: Login) {
    loginStorage.saveLogin(login: login)
  }
}
