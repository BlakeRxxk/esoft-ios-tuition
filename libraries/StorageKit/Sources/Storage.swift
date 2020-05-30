//
//  Storage.swift
//  StorageKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation
import RxSwift
import RealmSwift

public protocol Storage {
  associatedtype Entity
  func query() -> Observable<[Entity]>
  func query(sort sortDescriptors: [NSSortDescriptor]) -> Observable<[Entity]>
  func query(with predicate: NSPredicate, sort sortDescriptors: [NSSortDescriptor]) -> Observable<[Entity]>
  
  func save(entity: Entity, updateAllow: Bool) -> Completable
  func save(entities: [Entity]) -> Completable
  
  func delete(entity: Entity) -> Completable
  func deleteAll() -> Completable
}
