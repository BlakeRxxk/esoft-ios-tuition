//
//  EditSellerPriceUseCaseImplementation.swift
//  SellerTicketImplementation#iphonesimulator-x86_64
//
//  Created by wtildestar on 17/06/2020.
//

import RxSwift
import Network
import SellerTicketCore

public final class EditSellerPriceUseCaseImplementation {
  private var editSellerPriceRepository: EditSellerPriceRepository
  
  public init(editSellerPriceRepository: EditSellerPriceRepository) {
    self.editSellerPriceRepository = editSellerPriceRepository
  }
}

extension EditSellerPriceUseCaseImplementation: EditSellerPriceUseCase {
  public func invoke(request: EditSellerPriceRequest) -> Observable<[RecomendedPrice]> {
    switch request.scope {
    case .all:
      return editSellerPriceRepository
        .getRecomendedPrice()
        .flatMap { .just([$0]) }
        .asObservable()
    }
  }
}
