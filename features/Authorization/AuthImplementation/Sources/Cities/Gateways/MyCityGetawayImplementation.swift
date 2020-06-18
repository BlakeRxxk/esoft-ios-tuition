//
//  MyCityGetawayImplementation.swift
//  AuthImplementation#iphonesimulator-x86_64
//
//  Created by nedstar on 16.06.2020.
//

import RxSwift
import Network
import AuthCore

public final class MyCityGatewayImplementation {
  let networkService: NetworkAPIProtocol
  
  public init(networkService: NetworkAPIProtocol) {
    self.networkService = networkService
  }
}

extension MyCityGatewayImplementation: MyCityGateway {
  public func getSingle(url: URL) -> Single<MyCity> {
    networkService.request(url: url)
  }
}
