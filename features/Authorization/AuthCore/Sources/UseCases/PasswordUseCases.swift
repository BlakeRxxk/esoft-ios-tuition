//
//  PasswordUseCases.swift
//  AuthCore#iphonesimulator-x86_64
//
//  Created by nedstar on 18.06.2020.
//

import RxSwift

public protocol PasswordUseCase {
  func invoke(request: PasswordRequest) -> Observable<LoginAvailable>
}
