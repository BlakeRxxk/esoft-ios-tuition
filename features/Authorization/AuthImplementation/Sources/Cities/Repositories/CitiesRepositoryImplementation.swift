//
//  CitiesRepositoryImplementation.swift
//  AuthImplementation#iphonesimulator-x86_64
//
//  Created by nedstar on 14.06.2020.
//

import RxSwift
import Network
import AuthCore

public final class CitiesRepositoryImplementation {
  private var cityGateway: CitiesGateway
  private var citiesStorage: CitiesStorage

  public init(cityGateway: CitiesGateway, citiesStorage: CitiesStorage) {
    self.cityGateway = cityGateway
    self.citiesStorage = citiesStorage
  }
}

extension CitiesRepositoryImplementation: CitiesRepository {
  public func getList(searchQuery: String?) -> Single<[City]> {
    let request = CitiesQuery()

    return cityGateway
      .getList(url: request.url)
      .flatMap { [weak self] cities -> Single<[City]> in
        guard let self = self else { return .error(NSError(domain: "unknown", code: 102, userInfo: nil)) }
        
        return self.citiesStorage
          .saveCities(cities: cities)
          .andThen(Single.just(cities))
    }
  }
}
