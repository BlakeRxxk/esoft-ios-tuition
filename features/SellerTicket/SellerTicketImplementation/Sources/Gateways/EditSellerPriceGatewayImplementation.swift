//
//  EditSellerPriceGatewayImplementation.swift
//  SellerTicketImplementation#iphonesimulator-x86_64
//
//  Created by wtildestar on 16/06/2020.
//

import RxSwift
import Network
import SellerTicketCore

public final class EditSellerPriceGatewayImplementation {
  let networkService: NetworkAPIProtocol
  
  public init(networkService: NetworkAPIProtocol) {
    self.networkService = networkService
  }
}

extension EditSellerPriceGatewayImplementation: EditSellerPriceGateway {
  public func getRecomendedPrice(url: URL) -> Single<RecomendedPrice> {
    networkService.request(url: url)
  }
}
