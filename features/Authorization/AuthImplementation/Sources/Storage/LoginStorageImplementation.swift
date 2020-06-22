//
//  LoginStorageImplementation.swift
//  AuthImplementation#iphonesimulator-x86_64
//
//  Created by nedstar on 20.06.2020.
//

import Foundation
import StorageKit
import AuthCore
import RxSwift

public final class LoginStorageImplementation {
  var inMemoryStorage: StorageImplementation<Login>
  
  public init(inMemoryConfiguration: StorageConfiguration) {
    let config = inMemoryConfiguration.configuration
    self.inMemoryStorage = StorageImplementation<Login>(configuration: config)
  }
}

extension LoginStorageImplementation: LoginStorage {
  public func fetchLogin() -> Single<Login> {
    inMemoryStorage
      .query()
      .flatMapLatest { result -> Observable<Login> in
        guard let login = result.first else {
          return .error(NSError(domain: "not found", code: 101, userInfo: nil))
        }
        return .just(login)
      }
      .asSingle()
  }
  
  public func saveLogin(login: Login) -> Completable {
    inMemoryStorage.save(entity: login, updateAllow: true) // Не сохраняет
  }
}
