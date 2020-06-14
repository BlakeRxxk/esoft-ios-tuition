//
//  SpecialistsStorage.swift
//  SpecialistsCore
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import RxSwift

public protocol CitiesStorage {
  func fetchCity() -> Single<Int>
  func fetchCity(cityID: Int) -> Single<City>
  func saveCities(cities: [City]) -> Completable
}
