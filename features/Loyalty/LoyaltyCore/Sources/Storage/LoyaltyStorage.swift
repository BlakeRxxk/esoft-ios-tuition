//
//  LoyaltyStorage.swift
//  LoyaltyCore
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import RxSwift

public protocol LoyaltyStorage {
  func fetchLoyalty() -> Single<Int>
  func saveLoyalty(loyalty: [Loyalty]) -> Completable
}
