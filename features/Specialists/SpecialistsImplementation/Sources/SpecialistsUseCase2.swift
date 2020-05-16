//
//  AppDelegate.swift
//  Specialists
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import RxSwift
import Network
import SpecialistsCore

public final class SpecialistsUseCaseImplementation {
  private var specialistRepository: SpecialistsRepository
  
  public init(specialistRepository: SpecialistsRepository) {
    self.specialistRepository = specialistRepository
  }
}

extension SpecialistsUseCaseImplementation: SpecialistsUseCase {
  public func invoke(request: SpecialistsRequest) -> Observable<[Specialist]> {
    switch request.scope {
    case .all:
      return specialistRepository
        .getList(page: request.page, cityID: request.cityID, searchQuery: request.query)
        .catchError { error -> PrimitiveSequence<SingleTrait, [Specialist]> in
          print(error)
          return .just([])
        }.asObservable()
    case .my:
      return .just([])
    }
  }
}

public final class SpecialistsRepositoryImplementation {
  private var specialistGateway: SpecialistsGateway
  
  public init(specialistGateway: SpecialistsGateway) {
    self.specialistGateway = specialistGateway
  }
}

extension SpecialistsRepositoryImplementation: SpecialistsRepository {
  public func getList(page: Int, cityID: Int, searchQuery: String?) -> Single<[Specialist]> {
    specialistGateway.getList(url: URL(string: "https://developers.etagi.com/api/v2/catalogs")!)
  }
  
  public func getSingle(with ID: Int) -> Single<Specialist> {
    specialistGateway.getSingle(url: URL(string: "https://developers.etagi.com/api/v2/catalogs")!)
  }
}

public final class SpecialistsGatewayImplementation: NetworkAPI, SpecialistsGateway {
  public func getList(url: URL) -> Single<[Specialist]> {
    request(url: url)
  }
  
  public func getSingle(url: URL) -> Single<Specialist> {
    request(url: url)
  }
}
