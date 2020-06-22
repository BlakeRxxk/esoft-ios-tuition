//
//  RMLogin.swift
//  AuthImplementation#iphonesimulator-x86_64
//
//  Created by nedstar on 20.06.2020.
//

import Foundation
import RealmSwift
import AuthCore
import StorageKit

@objcMembers public final class RMLogin: Object {
  dynamic var id: String = ""
  dynamic var login: String = ""
  
  override public static func primaryKey() -> String? {
    "id"
  }
}

extension RMLogin: EntityConvertibleType {
  public func asEntity() -> Login {
    Login(login: login)
  }
}

extension Login: RealmRepresentable {
  public var uuid: String {
    Login.id
  }
  
  public func asRealm() -> RMLogin {
    RMLogin.build { object in
      object.id = Login.id
      object.login = login
    }
  }
}
