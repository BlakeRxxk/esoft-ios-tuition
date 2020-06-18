//
//  PasswordUseCaseImplementation.swift
//  AuthImplementation#iphonesimulator-x86_64
//
//  Created by nedstar on 18.06.2020.
//

import RxSwift
import Network
import AuthCore

public final class PasswordUseCaseImplementation {
  private var passwordRepository: PasswordRepository
  
  public init(passwordRepository: PasswordRepository) {
    self.passwordRepository = passwordRepository
  }
}

extension PasswordUseCaseImplementation: PasswordUseCase {
  public func invoke(request: PasswordRequest) -> Observable<LoginAvalible> {
    passwordRepository.getAvalible(searchQuery: request.query).asObservable()
  }
}
