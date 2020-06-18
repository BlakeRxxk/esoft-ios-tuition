//
//  RMCity.swift
//  AuthImplementation#iphonesimulator-x86_64
//
//  Created by nedstar on 14.06.2020.
//

import Foundation
import RealmSwift
import AuthCore
import StorageKit
import EsoftUIKit

@objcMembers public final class RMCity: Object {
  dynamic var id: Int = 0
  dynamic var name: String = ""
  dynamic var coords: String = ""
  dynamic var clockWrap: String?
  dynamic var country: Int = 0
  dynamic var eOfficeId: Int?
  dynamic var created: Date = Date()
  dynamic var updated: Date = Date()
  
  override public static func primaryKey() -> String? {
    "id"
  }
}

extension RMCity: EntityConvertibleType {
  public func asEntity() -> City {
    City(id: id,
         name: name,
         coords: coords,
         clockWrap: clockWrap,
         country: country,
         eOfficeId: eOfficeId,
         created: dateToString(from: created),
         updated: dateToString(from: updated))
  }
}

extension City: RealmRepresentable {
  public var uuid: String {
    ""
  }
  
  public func asRealm() -> RMCity {
    RMCountry.build { object in
      object.id = id
      object.name = name
      object.coords = coords
      object.clockWrap = clockWrap
      object.country = country
      object.eOfficeId = eOfficeId
      // Ошибка?
      object.created = stringToDate(from: created)!
      object.updated = stringToDate(from: updated)!
    }
  }
}
