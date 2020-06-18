//
//  PasswordGatewayImplementation.swift
//  AuthImplementation#iphonesimulator-x86_64
//
//  Created by nedstar on 18.06.2020.
//

import RxSwift
import Network
import AuthCore

public final class PasswordGatewayImplementation {
  let networkService: NetworkAPIProtocol
  
  public init(networkService: NetworkAPIProtocol) {
    self.networkService = networkService
  }
}

extension PasswordGatewayImplementation: PasswordGateway {
  public func getAvalible(url: URL) -> Single<LoginAvalible> {
    networkService.request(url: url)
  }
}
