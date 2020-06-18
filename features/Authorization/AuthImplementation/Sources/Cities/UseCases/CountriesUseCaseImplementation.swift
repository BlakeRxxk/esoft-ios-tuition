//
//  CountriesUseCaseImplementation.swift
//  AuthImplementation#iphonesimulator-x86_64
//
//  Created by nedstar on 14.06.2020.
//

import RxSwift
import Network
import AuthCore

public final class CountriesUseCaseImplementation {
  private var countryRepository: CountriesRepository
  
  public init(countryRepository: CountriesRepository) {
    self.countryRepository = countryRepository
  }
}

extension CountriesUseCaseImplementation: CountriesUseCase {
  public func invoke(request: CountriesRequest) -> Observable<[Country]> {
    countryRepository.getList(searchQuery: request.query).asObservable()
  }
}
