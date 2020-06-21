//
//  LoginUseCase.swift
//  AuthCore#iphonesimulator-x86_64
//
//  Created by nedstar on 19.06.2020.
//

import RxSwift

public protocol LoginUseCase {
  func getLogin() -> Observable<Login>
  func saveLogin(_ login: Login)
}
