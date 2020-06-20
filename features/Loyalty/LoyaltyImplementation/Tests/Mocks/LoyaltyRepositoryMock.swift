//
//  LoyaltyRepositoryMock.swift
//  LoyaltyImplementationTests
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import LoyaltyCore
import RxSwift

final class LoyaltyRepositoryMock: LoyaltyRepository {
  // func getListCount(cityID: Int, searchQuery: String?) -> Single<LoyaltyCount> {
  //   Single.just(LoyaltyCount(count: "145", countryCode: "RU"))
  // }
  
  // func getList(page: Int, cityID: Int, searchQuery: String?) -> Single<[Loyalty]> {
  //   if page == 2 {
  //     return Single.error(errorResponse())
  //   }
  //   return Single.just(successResponse())
  // }

}

extension LoyaltyRepositoryMock {
  // func successResponse() -> [Loyalty] {
  //   [Loyalty(id: "1", fio: "", lkId: 0, phone: "", email: "", photoUrl: "", lk: nil, position: "", positionID: "", managerID: "")]
  // }
  
  // func errorResponse() -> Error {
  //   NSError(domain: "mock error", code: 999, userInfo: nil)
  }
}
