//
//  SellerTicketRepositoryImplementation.swift
//  AppLibrary
//
//  Created by wtildestar on 23/05/2020.
//

import RxSwift
import Network
import SellerTicketCore

public final class SellerTicketRepositoryImplementation {
  private var sellerTicketGateway: SellerTicketGateway
  
  public init(sellerTicketGateway: SellerTicketGateway) {
    self.sellerTicketGateway = sellerTicketGateway
  }
}

extension SellerTicketRepositoryImplementation: SellerTicketRepository {
  public func getDesc() -> Single<Desc> {
    sellerTicketGateway.getDesc(url: URL(string: "https://us-central1-esoft-tuition-cloud.cloudfunctions.net/sellerTicket")!)
  }
  
  public func getRecomendedPrice() -> Single<RecomendedPrice> {
    sellerTicketGateway.getRecomendedPrice(url: URL(string: "https://us-central1-esoft-tuition-cloud.cloudfunctions.net/recomendedPrice")!)
  }
  
  public func getSellerTicket() -> Single<SellerTicket> {
    sellerTicketGateway.getSellerTicket(url: URL(string: "https://us-central1-esoft-tuition-cloud.cloudfunctions.net/sellerTicket")!)
  }
}
