//
//  SellerTicketGatewayImplementation.swift
//  AppLibrary
//
//  Created by wtildestar on 23/05/2020.
//

import RxSwift
import Network
import SellerTicketCore

public final class SellerTicketGatewayImplementation {
  let networkService: NetworkAPIProtocol
  
  public init(networkService: NetworkAPIProtocol) {
    self.networkService = networkService
  }
}

extension SellerTicketGatewayImplementation: SellerTicketGateway {
  public func getSellerTicket(url: URL) -> Single<SellerTicket> {
    networkService.request(url: url)
  }
}
