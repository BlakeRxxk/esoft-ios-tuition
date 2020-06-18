//
//  CountriesStorage.swift
//  AuthCore#iphonesimulator-x86_64
//
//  Created by nedstar on 13.06.2020.
//

import RxSwift

public protocol CountriesStorage {
  func fetchCountry() -> Single<Int>
  func fetchCountry(countryID: Int) -> Single<Country>
  func saveCountries(countries: [Country]) -> Completable
}
