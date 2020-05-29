//
//  SpecialistsRepositoryMock.swift
//  SpecialistsImplementationTests
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import SpecialistsCore
import RxSwift

final class SpecialistsRepositoryMock: SpecialistsRepository {
  func getListCount(cityID: Int, searchQuery: String?) -> Single<SpecialistsCount> {
    return Single.just(SpecialistsCount(count: "145", countryCode: "RU"))
  }
  
  func getList(page: Int, cityID: Int, searchQuery: String?) -> Single<[Specialist]> {
    if page == 2 {
      return Single.error(errorResponse())
    }
    return Single.just(successResponse())
  }

}

extension SpecialistsRepositoryMock {
  func successResponse() -> [Specialist] {
    [Specialist(id: "1", fio: "", lkId: 0, phone: "", email: "", photoUrl: "", lk: nil, position: "", positionID: "", managerID: "")]
  }
  
  func errorResponse() -> Error {
    NSError(domain: "mock error", code: 999, userInfo: nil)
  }
}
