//
//  CitiesStorage.swift
//  AuthCore#iphonesimulator-x86_64
//
//  Created by nedstar on 13.06.2020.
//

import RxSwift

public protocol CitiesStorage {
  func fetchCity() -> Single<Int>
  func fetchCity(cityID: Int) -> Single<City>
  func saveCities(cities: [City]) -> Completable
}
