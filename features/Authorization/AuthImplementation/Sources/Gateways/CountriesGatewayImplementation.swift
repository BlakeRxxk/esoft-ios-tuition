//
//  CountriesGatewayImplementation.swift
//  AuthImplementation#iphonesimulator-x86_64
//
//  Created by nedstar on 14.06.2020.
//

import RxSwift
import Network
import AuthCore

public final class CountriesGatewayImplementation {
  let networkService: NetworkAPIProtocol
  
  public init(networkService: NetworkAPIProtocol) {
    self.networkService = networkService
  }
}

extension CountriesGatewayImplementation: CountriesGateway {
  public func getList(url: URL) -> Single<[Country]> {
    networkService.request(url: url)
  }
}
