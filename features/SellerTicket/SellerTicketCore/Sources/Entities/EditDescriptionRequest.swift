//
//  EditDescriptionRequest.swift
//  SellerTicketCore#iphonesimulator-x86_64
//
//  Created by wtildestar on 26/06/2020.
//

public enum EditDescriptionScope: String {
  case all
}

public struct EditDescriptionRequest {
  public var scope: EditDescriptionScope
  
  public init(scope: EditDescriptionScope = .all) {
    self.scope = scope
  }
}
