//
//  ObjectsRequest.swift
//  ObjectsCore#iphonesimulator-x86_64
//
//  Created by Алексей Макаров on 26.05.2020.
//

public enum ObjectsScope: String {
  case my
  case all
}

public struct ObjectsRequest {
  public var scope: ObjectsScope
  public var cityID: Int
  public var query: String?
  public var page: Int

  public init(scope: ObjectsScope = .all,
              cityID: Int = 23,
              query: String = "",
              page: Int) {
    self.scope = scope
    self.cityID = cityID
    self.query = query
    self.page = page
  }
}
