//
//  CitiesStorageImplementation.swift
//  AuthImplementation#iphonesimulator-x86_64
//
//  Created by nedstar on 14.06.2020.
//

import Foundation
import StorageKit
import AuthCore
import RxSwift

public final class CitiesStorageImplementation {
  var inMemoryStorage: StorageImplementation<City>
  
  public init(inMemoryConfiguration: StorageConfiguration) {
    let config = inMemoryConfiguration.configuration
    self.inMemoryStorage = StorageImplementation<City>(configuration: config)
  }
}

extension CitiesStorageImplementation: CitiesStorage {
  public func fetchCity() -> Single<Int> {
    inMemoryStorage.query().map { $0.count }.asSingle()
  }

  public func fetchCity(cityID: Int) -> Single<City> {
    let predicate = NSPredicate(format: "id == %d", cityID)
    return inMemoryStorage
      .query(with: predicate)
      .flatMapLatest { result -> Observable<City> in
        guard let city = result.first else {
          return .error(NSError(domain: "not found", code: 101, userInfo: nil))
        }
        
        return .just(city)
    }.asSingle()
  }
  
  public func saveCities(cities: [City]) -> Completable {
    inMemoryStorage.save(entities: cities, updateAllow: true)
  }
}
