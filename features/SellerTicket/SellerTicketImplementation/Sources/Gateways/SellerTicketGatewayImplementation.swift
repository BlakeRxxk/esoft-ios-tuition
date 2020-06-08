//
//  SellerTicketGatewayImplementation.swift
//  AppLibrary
//
//  Created by wtildestar on 23/05/2020.
//

import RxSwift
import Network
import SellerTicketCore

public final class SellerTicketGatewayImplementation: NetworkAPI, SellerTicketGateway {
  public func getSellerTicket(url: URL) -> Single<SellerTicket> {
    request(url: url)
  }
}
