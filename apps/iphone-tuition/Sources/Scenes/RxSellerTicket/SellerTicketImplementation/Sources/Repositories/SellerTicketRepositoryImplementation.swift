//
//  SellerTicketRepositoryImplementation.swift
//  AppLibrary
//
//  Created by wtildestar on 23/05/2020.
//

import RxSwift
import Network
import SpecialistsCore

public final class SellerTicketRepositoryImplementation {
  private var sellerTicketGateway: SellerTicketGateway
  
  public init(sellerTicketGateway: SellerTicketGateway) {
    self.sellerTicketGateway = sellerTicketGateway
  }
}

extension SellerTicketRepositoryImplementation: SellerTicketRepository {
  //  public func getList(page: Int, cityID: Int, searchQuery: String?) -> Single<[SellerTicket]> {
  //    sellerTicketGateway.getList(url: URL(string: "https://developers.etagi.com/api/v2/catalogs")!)
  //  }
  
  public func getSingle(with ID: String) -> Single<SellerTicket> {
    sellerTicketGateway.getSingle(url: URL(string: "https://us-central1-esoft-tuition-cloud.cloudfunctions.net/sellerTicket")!)
  }
}
