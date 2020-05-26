//
//  SellerTicketRepository.swift
//  AppLibrary
//
//  Created by wtildestar on 23/05/2020.
//

import RxSwift

public protocol SellerTicketRepository {
  //  func getList(cityID: Int, price: String) -> Single<[SellerTicket]>
  func getSingle(with ID: String) -> Single<SellerTicket>
}
