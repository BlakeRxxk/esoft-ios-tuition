//
//  EditSellerPriceUseCase.swift
//  SellerTicketCore#iphonesimulator-x86_64
//
//  Created by wtildestar on 16/06/2020.
//

import RxSwift

public protocol EditSellerPriceUseCase {
  func invoke(request: EditSellerPriceRequest) -> Observable<[RecomendedPrice]>
}
