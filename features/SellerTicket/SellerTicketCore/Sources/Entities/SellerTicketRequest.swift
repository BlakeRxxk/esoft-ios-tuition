//
//  SellerTicketRequest.swift
//  AppLibrary
//
//  Created by wtildestar on 23/05/2020.
//

public enum SellerTicketScope: String {
  case all
}

public struct SellerTicketRequest {
  public var id: String
  public var price: String
  public var photos: [Photos]
  public var scope: SellerTicketScope

  
  public init(id: String = "1868764",
              price: String = "5400",
              photos: [Photos] = [],
              scope: SellerTicketScope = .all) {
    self.id = id
    self.price = price
    self.photos = photos
    self.scope = scope
  }
}
