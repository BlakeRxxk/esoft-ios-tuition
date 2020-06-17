//
//  RMCountry.swift
//  AuthImplementation#iphonesimulator-x86_64
//
//  Created by nedstar on 14.06.2020.
//

import Foundation
import RealmSwift
import AuthCore
import StorageKit

@objcMembers public final class RMCountry: Object {
  dynamic var id: Int = 0
  dynamic var name: String = ""
  dynamic var currency: Int = 0
  dynamic var countryCode: String?
  
  override public static func primaryKey() -> String? {
    "id"
  }
}

extension RMCountry: EntityConvertibleType {
  public func asEntity() -> Country {
    Country(id: id,
            name: name,
            currency: currency,
            countryCode: countryCode)
  }
}

extension Country: RealmRepresentable {
  public var uuid: String {
    ""
  }
  
  public func asRealm() -> RMCountry {
    RMCountry.build { object in
      object.id = id
      object.name = name
      object.currency = currency
      object.countryCode = countryCode
    }
  }
}
