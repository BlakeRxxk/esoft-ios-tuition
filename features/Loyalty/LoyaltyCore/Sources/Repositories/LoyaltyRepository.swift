//
//  LoyaltyRepository.swift
//  LoyaltyCore
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import RxSwift

public protocol LoyaltyRepository {
  func getLoyalty() -> Single<[Loyalty]>
}
