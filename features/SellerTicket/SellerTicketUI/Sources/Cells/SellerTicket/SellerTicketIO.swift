//
//  SellerTicketIO.swift
//  AppLibrary
//
//  Created by wtildestar on 23/05/2020.
//

import Foundation

public protocol SellerTicketCellInput {
  var sellerTicketID: Int { get set }
  var desc: String { get set }
}

public protocol SellerTicketCellOutput: AnyObject {
  func didTapEditSellerPrice(in cell: SellerTicketCellInput)
  func didTapEditDescription(in cell: SellerTicketCellInput)
}
