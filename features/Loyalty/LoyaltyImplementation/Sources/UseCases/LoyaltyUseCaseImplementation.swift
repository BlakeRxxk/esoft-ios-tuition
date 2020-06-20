//
//  LoyaltyUseCaseImplementation.swift
//  LoyaltyImplementation
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import RxSwift
import Network
import LoyaltyCore

public final class LoyaltyUseCaseImplementation {
  private var loyaltyRepository: LoyaltyRepository
  
  public init(loyaltyRepository: LoyaltyRepository) {
    self.loyaltyRepository = loyaltyRepository
  }
}

extension LoyaltyUseCaseImplementation: LoyaltyUseCase {
  public func invoke(request: LoyaltyRequest) -> Observable<([Loyalty])> {
    switch request.scope {
    case .all:
      let loyaltyObservable = loyaltyRepository
        .getLoyalty()
        .asObservable()
      
      return loyaltyObservable
      
    case .my:
      return .just(([]))
    }
  }
}
