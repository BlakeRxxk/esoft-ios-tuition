//
//  SpecialistsRepositoryImplementation.swift
//  SpecialistsImplementation
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import RxSwift
import Network
import SpecialistsCore

public final class SpecialistsRepositoryImplementation {
  private var specialistGateway: LoyaltyGateway
  private var specialistsStorage: SpecialistsStorage

  public init(specialistGateway: LoyaltyGateway, specialistsStorage: SpecialistsStorage) {
    self.specialistGateway = specialistGateway
    self.specialistsStorage = specialistsStorage
  }
}

extension SpecialistsRepositoryImplementation: LoyaltyRepository {
  public func getList(page: Int, cityID: Int, searchQuery: String?) -> Single<[Specialist]> {
    let request = SpecialistsQuery(cityID: cityID, page: page, count: false, search: searchQuery)

    return specialistGateway
      .getList(url: request.url)
      .flatMap { [weak self] specialists -> Single<[Specialist]> in
        guard let self = self else { return .error(NSError(domain: "unknown", code: 102, userInfo: nil)) }
        
        return self.specialistsStorage
          .saveSpecialists(specialists: specialists)
          .andThen(Single.just(specialists))
    }
  }
  
  public func getListCount(cityID: Int, searchQuery: String?) -> Single<SpecialistsCount> {
    let request = SpecialistsQuery(cityID: cityID, page: 1, count: true, search: searchQuery)
    
    return specialistGateway.getListCount(url: request.url)
  }
}
