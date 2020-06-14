//
//  CountriesRepositoryImplementation.swift
//  AuthImplementation#iphonesimulator-x86_64
//
//  Created by nedstar on 14.06.2020.
//

import RxSwift
import Network
import AuthCore

public final class CountriesRepositoryImplementation {
  private var countryGateway: CountriesGateway
  private var countriesStorage: CountriesStorage

  public init(countryGateway: CountriesGateway, countriesStorage: CountriesStorage) {
    self.countryGateway = countryGateway
    self.countriesStorage = countriesStorage
  }
}

extension CountriesRepositoryImplementation: CountriesRepository {
  public func getList(searchQuery: String?) -> Single<[Country]> {
    let request = CountriesQuery()

    return countryGateway
      .getList(url: request.url)
      .flatMap { [weak self] countries -> Single<[Country]> in
        guard let self = self else { return .error(NSError(domain: "unknown", code: 102, userInfo: nil)) }
        
        return self.countriesStorage
          .saveCountries(countries: countries)
          .andThen(Single.just(countries))
    }
  }
}
