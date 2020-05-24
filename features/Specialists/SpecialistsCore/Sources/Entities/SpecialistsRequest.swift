//
//  SpecialistsRequest.swift
//  SpecialistsCore
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

public enum SpecialistScope: String {
  case my
  case all
}

public struct SpecialistsRequest {
  public var scope: SpecialistScope
  public var cityID: Int
  public var query: String?
  public var page: Int
  
  public init(scope: SpecialistScope = .all,
              cityID: Int = 23,
              query: String = "",
              page: Int) {
    self.scope = scope
    self.cityID = cityID
    self.query = query
    self.page = page
  }
}
