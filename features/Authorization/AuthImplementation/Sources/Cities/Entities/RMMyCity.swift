//
//  RMMyCity.swift
//  AuthImplementation#iphonesimulator-x86_64
//
//  Created by nedstar on 16.06.2020.
//

import Foundation
import RealmSwift
import AuthCore
import StorageKit

@objcMembers public final class RMMyCity: Object {
  dynamic var id: String = ""
  dynamic var name: String = ""
  dynamic var distance: Int = 0
  
  override public static func primaryKey() -> String? {
    "id"
  }
}

extension RMMyCity: EntityConvertibleType {
  public func asEntity() -> MyCity {
    MyCity(id: id,
           name: name,
           distance: distance)
  }
}

extension MyCity: RealmRepresentable {
  public var uuid: String {
    ""
  }
  
  public func asRealm() -> RMMyCity {
    RMMyCity.build { object in
      object.id = id
      object.name = name
      object.distance = distance
    }
  }
}
