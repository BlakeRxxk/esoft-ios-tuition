//
//  SellerTicketList+Sections.swift
//  SellerTicketUI#iphonesimulator-x86_64
//
//  Created by wtildestar on 19/06/2020.
//

import Foundation

extension SellerTicketList: SellerTicketSectionControllerOutput {
  public func didTapEditDescription(in cell: SellerTicketCellInput) {
    print("didTapEditDescription in SellerTicketList")
    router?.routeToEditDescription(sellerTicketID: cell.sellerTicketID)
  }
  
  public func didTapEditSellerPrice(in cell: SellerTicketCellInput) {
    print("didTapEditSellerPrice in SellerTicketList")
    router?.routeToEditSellerPrice(sellerTicketID: cell.sellerTicketID)
  }
  
}
