//
//  EntityConvertibleType.swift
//  StorageKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation

public protocol EntityConvertibleType {
  associatedtype EntityType

  func asEntity() -> EntityType
}
