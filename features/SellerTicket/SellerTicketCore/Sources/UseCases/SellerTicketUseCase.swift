//
//  SellerTicketUseCase.swift
//  AppLibrary
//
//  Created by wtildestar on 23/05/2020.
//

import RxSwift

public protocol SellerTicketUseCase {
  func invoke(request: SellerTicketRequest) -> Observable<[SellerTicket]>
  func invoke(request: EditSellerPriceRequest) -> Observable<[RecomendedPrice]>
  func invoke(request: EditDescriptionRequest) -> Observable<[Desc]>
}
