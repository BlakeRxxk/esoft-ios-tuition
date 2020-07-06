//
//  SellerTicketRepository.swift
//  AppLibrary
//
//  Created by wtildestar on 23/05/2020.
//

import RxSwift

public protocol SellerTicketRepository {
  func getSellerTicket() -> Single<SellerTicket>
  func getRecomendedPrice() -> Single<RecomendedPrice>
  func getDesc() -> Single<Desc>
}
