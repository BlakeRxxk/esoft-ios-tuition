//
//  EditSellerPriceRequest.swift
//  SellerTicketCore#iphonesimulator-x86_64
//
//  Created by wtildestar on 16/06/2020.
//

public enum EditSellerPriceScope: String {
  case all
}

public struct EditSellerPriceRequest {
  public var scope: EditSellerPriceScope
  
  public init(scope: EditSellerPriceScope = .all) {
    self.scope = scope
  }
}
