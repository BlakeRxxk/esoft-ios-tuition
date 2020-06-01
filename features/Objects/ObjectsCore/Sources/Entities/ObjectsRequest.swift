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
  public var query: String?

  public init(scope: ObjectsScope = .all,
              query: String = "" ) {
    self.scope = scope
    self.query = query
  }
}
