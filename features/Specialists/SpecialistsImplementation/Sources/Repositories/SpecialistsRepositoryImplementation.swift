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
