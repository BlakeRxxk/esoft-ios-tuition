//
//  SellerTicketList+Sections.swift
//  SellerTicketUI#iphonesimulator-x86_64
//
//  Created by wtildestar on 19/06/2020.
//

import Foundation

extension SellerTicketList: SellerTicketSectionControllerOutput {
  public func didTapEditSellerPrice(in cell: SellerTicketCellInput) {
    router?.routeToEditSellerPrice(sellerTicketID: cell.sellerTicketID)
    print("didTapEditSellerPrice in SellerTicketList")
  }
}
