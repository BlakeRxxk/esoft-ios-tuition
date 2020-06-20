//
//  LoyaltyGateway.swift
//  LoyaltyCore
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation
import RxSwift

public protocol LoyaltyGateway {
  func getLoyalty(url: URL) -> Single<Loyalty>
}
