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
  public var scope: SellerTicketScope

  public init(scope: SellerTicketScope = .all) {
    self.scope = scope
  }
}
