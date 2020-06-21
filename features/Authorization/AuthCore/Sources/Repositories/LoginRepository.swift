//
//  LoginRepository.swift
//  AuthCore#iphonesimulator-x86_64
//
//  Created by nedstar on 19.06.2020.
//

import RxSwift

public protocol LoginRepository {
  func getLogin() -> Single<Login>
  func saveLogin(_ login: Login)
}
