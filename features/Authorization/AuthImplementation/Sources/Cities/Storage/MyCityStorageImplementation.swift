//
//  MyCityStorageImplementation.swift
//  AuthImplementation#iphonesimulator-x86_64
//
//  Created by nedstar on 16.06.2020.
//

import Foundation
import StorageKit
import AuthCore
import RxSwift

public final class MyCityStorageImplementation {
  var inMemoryStorage: StorageImplementation<MyCity>
  
  public init(inMemoryConfiguration: StorageConfiguration) {
    let config = inMemoryConfiguration.configuration
    self.inMemoryStorage = StorageImplementation<MyCity>(configuration: config)
  }
}

extension MyCityStorageImplementation: MyCityStorage {
  public func fetchCity() -> Single<Int> {
    inMemoryStorage.query().map { $0.count }.asSingle()
  }

  public func fetchCity(cityID: Int) -> Single<MyCity> {
    let predicate = NSPredicate(format: "id == %d", cityID)
    return inMemoryStorage
      .query(with: predicate)
      .flatMapLatest { result -> Observable<MyCity> in
        guard let city = result.first else {
          return .error(NSError(domain: "not found", code: 101, userInfo: nil))
        }
        
        return .just(city)
    }.asSingle()
  }
  
  public func saveCity(city: MyCity) -> Completable {
    inMemoryStorage.save(entity: city)
  }
}
