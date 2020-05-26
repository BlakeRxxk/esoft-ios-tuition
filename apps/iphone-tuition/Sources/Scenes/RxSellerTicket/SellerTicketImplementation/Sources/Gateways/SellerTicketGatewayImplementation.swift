//
//  SellerTicketGatewayImplementation.swift
//  AppLibrary
//
//  Created by wtildestar on 23/05/2020.
//

import RxSwift
import Network
import SpecialistsCore

public final class SellerTicketGatewayImplementation: NetworkAPI, SellerTicketGateway {
  //  public func getList(url: URL) -> Single<[SellerTicket]> {
  //    request(url: url)
  //  }
  
  public func getSingle(url: URL) -> Single<SellerTicket> {
    request(url: url)
  }
}
