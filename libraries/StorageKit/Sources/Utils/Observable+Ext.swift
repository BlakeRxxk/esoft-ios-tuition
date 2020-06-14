//
//  Observable+Ext.swift
//  StorageKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation
import RxSwift

extension Observable where Element: Sequence, Element.Iterator.Element: EntityConvertibleType {
  typealias EntityType = Element.Iterator.Element.EntityType
  
  func mapToEntity() -> Observable<[EntityType]> {
    map { $0.mapToEntity() }
  }
}

extension Sequence where Iterator.Element: EntityConvertibleType {
  func mapToEntity() -> [Iterator.Element.EntityType] {
    map { $0.asEntity() }
  }
}
