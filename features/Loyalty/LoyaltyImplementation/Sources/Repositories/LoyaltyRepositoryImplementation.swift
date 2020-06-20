//
//  LoyaltyRepositoryImplementation.swift
//  LoyaltyImplementation
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import RxSwift
import Network
import LoyaltyCore

public final class LoyaltyRepositoryImplementation {
  private var loyaltyGateway: LoyaltyGateway
  private var loyaltyStorage: LoyaltyStorage

  public init(loyaltyGateway: LoyaltyGateway, loyaltyStorage: LoyaltyStorage) {
    self.loyaltyGateway = loyaltyGateway
    self.loyaltyStorage = loyaltyStorage
  }
}

extension LoyaltyRepositoryImplementation: LoyaltyRepository {
  public func getLoyalty() -> Single<[Loyalty]> {
    let request = LoyaltyQuery()

    return loyaltyGateway
      .getLoyalty(url: request.url)
      .flatMap { [weak self] loyalty -> Single<[Loyalty]> in
        guard let self = self else { return .error(NSError(domain: "unknown", code: 102, userInfo: nil)) }
        
        return self.loyaltyStorage
          .saveLoyalty(loyalty: [loyalty])
          .andThen(Single.just([loyalty]))
    }
  }
}
