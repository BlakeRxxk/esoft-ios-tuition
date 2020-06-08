//
//  SellerTicketStorage.swift
//  AppLibrary
//
//  Created by wtildestar on 23/05/2020.
//

import RxSwift

protocol SellerTicketStorage {
  func fetchSellerTicket(cityID: String) -> Single<SellerTicket>
  func saveSellerTicket(sellerTicket: SellerTicket) -> Completable
}
