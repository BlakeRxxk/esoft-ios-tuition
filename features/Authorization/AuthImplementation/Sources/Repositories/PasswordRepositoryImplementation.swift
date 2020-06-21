//
//  PasswordRepositoryImplementation.swift
//  AuthImplementation#iphonesimulator-x86_64
//
//  Created by nedstar on 18.06.2020.
//

import RxSwift
import Network
import AuthCore

public final class PasswordRepositoryImplementation {
  private var passwordGateway: PasswordGateway

  public init(passwordGateway: PasswordGateway) {
    self.passwordGateway = passwordGateway
  }
}

extension PasswordRepositoryImplementation: PasswordRepository {
  public func getAvalible(searchQuery: String?) -> Single<LoginAvailable> {
    let request = PasswordQuery()
    
//    return .error(NSError(domain: "Отсутствует интернет соединение", code: 102, userInfo: nil))
    return passwordGateway.getAvalible(url: request.url).debug()
  }
}
