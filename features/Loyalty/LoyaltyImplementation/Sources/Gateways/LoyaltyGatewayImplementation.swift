//
//  LoyaltyGatewayImplementation.swift
//  LoyaltyImplementation
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import RxSwift
import Network
import LoyaltyCore

public final class LoyaltyGatewayImplementation {
  let networkService: NetworkAPIProtocol
  
  public init(networkService: NetworkAPIProtocol) {
    self.networkService = networkService
  }
}

extension LoyaltyGatewayImplementation: LoyaltyGateway {
  public func getLoyalty(url: URL) -> Single<Loyalty> {
    networkService.request(url: url)
  }
}
