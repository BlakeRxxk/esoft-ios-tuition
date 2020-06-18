//
//  CitiesGatewayImplementation.swift
//  AuthImplementation#iphonesimulator-x86_64
//
//  Created by nedstar on 14.06.2020.
//

import RxSwift
import Network
import AuthCore

public final class CitiesGatewayImplementation {
  let networkService: NetworkAPIProtocol
  
  public init(networkService: NetworkAPIProtocol) {
    self.networkService = networkService
  }
}

extension CitiesGatewayImplementation: CitiesGateway {
  public func getList(url: URL) -> Single<[City]> {
    networkService.request(url: url)
  }
}
