//
//  ObjectsRequest.swift
//  ObjectsCore#iphonesimulator-x86_64
//
//  Created by Алексей Макаров on 26.05.2020.
//

public enum ObjectsScope: String {
  case all
}

public struct ObjectsRequest {
  public var scope: ObjectsScope

  public init(scope: ObjectsScope = .all) {
    self.scope = scope
  }
}
