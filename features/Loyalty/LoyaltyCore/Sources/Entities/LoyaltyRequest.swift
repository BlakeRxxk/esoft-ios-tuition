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
  public var cityID: Int
  public var query: String?
  public var page: Int
  
  public init(scope: LoyaltyScope = .all,
              cityID: Int = 23,
              query: String = "",
              page: Int) {
    self.scope = scope
    self.cityID = cityID
    self.query = query
    self.page = page
  }
}
