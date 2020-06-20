//
//  LoyaltyRequest.swift
//  LoyaltyCore
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

public enum LoyaltyScope: String {
  case my
  case all
}

public struct LoyaltyRequest {
  public var scope: LoyaltyScope
  
  public init(scope: LoyaltyScope = .all) {
    self.scope = scope
  }
}
