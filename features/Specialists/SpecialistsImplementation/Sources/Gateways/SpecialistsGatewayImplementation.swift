//
//  SpecialistsGatewayImplementation.swift
//  SpecialistsImplementation
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import RxSwift
import Network
import SpecialistsCore

public final class SpecialistsGatewayImplementation {
  let networkService: NetworkAPIProtocol
  
  public init(networkService: NetworkAPIProtocol) {
    self.networkService = networkService
  }
}

extension SpecialistsGatewayImplementation: SpecialistsGateway {
  public func getListCount(url: URL) -> Single<SpecialistsCount> {
    networkService.request(url: url)
  }
  
  public func getList(url: URL) -> Single<[Specialist]> {
    networkService.request(url: url)
  }
}
