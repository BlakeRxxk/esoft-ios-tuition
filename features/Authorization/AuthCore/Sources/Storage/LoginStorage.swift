//
//  LoginStorage.swift
//  AuthCore#iphonesimulator-x86_64
//
//  Created by nedstar on 19.06.2020.
//

import RxSwift

public protocol LoginStorage {
  func fetchLogin() -> Single<Login>
  func saveLogin(login: Login) -> Completable
}
