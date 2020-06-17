//
//  CitiesUseCaseImplementation.swift
//  AuthImplementation#iphonesimulator-x86_64
//
//  Created by nedstar on 14.06.2020.
//

import RxSwift
import Network
import AuthCore

public final class CitiesUseCaseImplementation {
  private var citiesRepository: CitiesRepository
  
  public init(citiesRepository: CitiesRepository) {
    self.citiesRepository = citiesRepository
  }
}

extension CitiesUseCaseImplementation: CitiesUseCase {
  public func invoke(request: CitiesRequest) -> Observable<[City]> {
    citiesRepository.getList(searchQuery: request.query).asObservable()
  }
}
