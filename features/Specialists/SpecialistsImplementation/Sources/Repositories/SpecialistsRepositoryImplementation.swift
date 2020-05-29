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
  private var specialistGateway: SpecialistsGateway
  
  public init(specialistGateway: SpecialistsGateway) {
    self.specialistGateway = specialistGateway
    specialistGateway
  }
}

extension SpecialistsRepositoryImplementation: SpecialistsRepository {
  public func getList(page: Int, cityID: Int, searchQuery: String?) -> Single<[Specialist]> {
    let request = SpecialistsQuery(cityID: cityID, page: page, count: false, search: searchQuery)
    
    return specialistGateway.getList(url: request.url)
  }
  
  public func getListCount(cityID: Int, searchQuery: String?) -> Single<SpecialistsCount> {
    let request = SpecialistsQuery(cityID: cityID, page: 1, count: true, search: searchQuery)
    
    return specialistGateway.getListCount(url: request.url)
  }
}
