//
//  EditSellerPriceGateway.swift
//  SellerTicketCore#iphonesimulator-x86_64
//
//  Created by wtildestar on 16/06/2020.
//

import Foundation
import RxSwift

public protocol EditSellerPriceGateway {
  func getRecomendedPrice(url: URL) -> Single<RecomendedPrice>
}
