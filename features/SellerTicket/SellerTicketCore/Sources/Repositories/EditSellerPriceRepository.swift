//
//  EditSellerPriceRepository.swift
//  SellerTicketCore#iphonesimulator-x86_64
//
//  Created by wtildestar on 16/06/2020.
//

import RxSwift

public protocol EditSellerPriceRepository {
  func getRecomendedPrice() -> Single<RecomendedPrice>
}
