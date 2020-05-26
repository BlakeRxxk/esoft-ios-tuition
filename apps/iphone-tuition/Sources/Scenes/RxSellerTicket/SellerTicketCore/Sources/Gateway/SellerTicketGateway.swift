//
//  SellerTicketGateway.swift
//  AppLibrary
//
//  Created by wtildestar on 23/05/2020.
//

import Foundation
import RxSwift

public protocol SellerTicketGateway {
  //  func getList(url: URL) -> Single<[SellerTicket]>
  func getSingle(url: URL) -> Single<SellerTicket>
}
