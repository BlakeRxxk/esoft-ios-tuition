//
//  SellerTicketIO.swift
//  AppLibrary
//
//  Created by wtildestar on 23/05/2020.
//

import Foundation

public protocol SellerTicketCellInput {
  var sellerTicketID: Int { get set }
}

public protocol SellerTicketCellOutput: class {
  func didTapEditSellerPrice(in cell: SellerTicketCellInput)
}
