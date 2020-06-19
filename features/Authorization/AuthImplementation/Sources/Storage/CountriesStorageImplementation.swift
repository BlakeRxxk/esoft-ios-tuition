//
//  CountriesStorageImplementation.swift
//  AuthImplementation#iphonesimulator-x86_64
//
//  Created by nedstar on 14.06.2020.
//

import Foundation
import StorageKit
import AuthCore
import RxSwift

public final class CountriesStorageImplementation {
  var inMemoryStorage: StorageImplementation<Country>
  
  public init(inMemoryConfiguration: StorageConfiguration) {
    let config = inMemoryConfiguration.configuration
    self.inMemoryStorage = StorageImplementation<Country>(configuration: config)
  }
}

extension CountriesStorageImplementation: CountriesStorage {
  public func fetchCountry() -> Single<Int> {
    inMemoryStorage.query().map { $0.count }.asSingle()
  }

  public func fetchCountry(countryID: Int) -> Single<Country> {
    let predicate = NSPredicate(format: "id == %d", countryID)
    return inMemoryStorage
      .query(with: predicate)
      .flatMapLatest { result -> Observable<Country> in
        guard let country = result.first else {
          return .error(NSError(domain: "not found", code: 101, userInfo: nil))
        }
        
        return .just(country)
    }.asSingle()
  }
  
  public func saveCountries(countries: [Country]) -> Completable {
    inMemoryStorage.save(entities: countries, updateAllow: true)
  }
}
