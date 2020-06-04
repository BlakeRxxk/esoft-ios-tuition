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
  public func invoke(request: SellerTicketRequest) -> Observable<SellerTicket> {
    switch request.scope {
    case .all:
      return sellerTicketRepository
        .getSingle(with: request.id)
        .catchError { _ -> PrimitiveSequence<SingleTrait, SellerTicket> in
          .just(SellerTicket(id: request.id, price: request.price))
      }.asObservable()

      //        .getList(page: request.page, cityID: request.cityID, searchQuery: request.query)
      //        .catchError { _ -> PrimitiveSequence<SingleTrait, [SellerTicket]> in
      //          .just([])
    //        }.asObservable()
    case .my:
      return .just(SellerTicket(id: request.id, price: request.price))
    }
  }
}
