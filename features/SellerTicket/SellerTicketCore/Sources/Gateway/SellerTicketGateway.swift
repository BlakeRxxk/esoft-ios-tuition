//
//  SellerTicketGateway.swift
//  AppLibrary
//
//  Created by wtildestar on 23/05/2020.
//

import Foundation
import RxSwift

public protocol SellerTicketGateway {
  func getSellerTicket(url: URL) -> Single<SellerTicket>
  func getRecomendedPrice(url: URL) -> Single<RecomendedPrice>
  func getDesc(url: URL) -> Single<Desc>
}
