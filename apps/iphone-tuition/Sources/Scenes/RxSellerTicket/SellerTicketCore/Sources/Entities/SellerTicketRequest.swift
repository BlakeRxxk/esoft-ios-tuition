//
//  SellerTicketRequest.swift
//  AppLibrary
//
//  Created by wtildestar on 23/05/2020.
//

public enum SellerTicketScope: String {
  case my
  case all
}

public struct SellerTicketRequest {
  public var scope: SellerTicketScope
  public let id: String
  public let price: String
  
  public init(scope: SellerTicketScope = .all,
              id: String = "23",
              price: String = "5400") {
    self.scope = scope
    self.id = id
    self.price = price
  }
}
