//
//  LoyaltyUseCase.swift
//  LoyaltyCore
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import RxSwift

public protocol LoyaltyUseCase {
  func invoke(request: LoyaltyRequest) -> Observable<([Loyalty])>
}
