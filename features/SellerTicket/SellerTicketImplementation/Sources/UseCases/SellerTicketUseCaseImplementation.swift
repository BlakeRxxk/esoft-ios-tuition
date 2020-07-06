//
//  SellerTicketUseCaseImplementation.swift
//  AppLibrary
//
//  Created by wtildestar on 23/05/2020.
//

import RxSwift
import Network
import SellerTicketCore

public final class SellerTicketUseCaseImplementation {
  private var sellerTicketRepository: SellerTicketRepository
  
  public init(sellerTicketRepository: SellerTicketRepository) {
    self.sellerTicketRepository = sellerTicketRepository
  }
}

extension SellerTicketUseCaseImplementation: SellerTicketUseCase {
  public func invoke(request: EditDescriptionRequest) -> Observable<[Desc]> {
    switch request.scope {
    case .all:
      return sellerTicketRepository
        .getDesc()
        .flatMap { .just([$0]) }
        .asObservable()
    }
  }
  
  public func invoke(request: EditSellerPriceRequest) -> Observable<[RecomendedPrice]> {
    switch request.scope {
    case .all:
      return sellerTicketRepository
        .getRecomendedPrice()
        .flatMap { .just([$0]) }
        .asObservable()
    }
  }
  
  public func invoke(request: SellerTicketRequest) -> Observable<[SellerTicket]> {
    switch request.scope {
    case .all:
      return sellerTicketRepository
        .getSellerTicket()
        .flatMap { .just([$0]) }
        .asObservable()
    }
  }
}
