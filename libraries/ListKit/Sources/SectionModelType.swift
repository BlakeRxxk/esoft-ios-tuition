//
//  SectionModelType.swift
//  ListKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation
import IGListDiffKit

public typealias SectionModelDiffable = SectionModelType & ListDiffable

public protocol SectionModelType {
  associatedtype ObjectType: ListDiffable
  var object: ObjectType { get }
}

public extension SectionModelType where Self: ListDiffable, Self.ObjectType == Self {
  var object: ObjectType {
    self
  }
}
