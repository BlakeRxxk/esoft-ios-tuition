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
  dynamic var login: String = ""
  
  override public static func primaryKey() -> String? {
    "login"
  }
}

extension RMLogin: EntityConvertibleType {
  public func asEntity() -> Login {
    Login(login: login)
  }
}

extension Login: RealmRepresentable {
  public var uuid: String {
    ""
  }
  
  public func asRealm() -> RMLogin {
    RMLogin.build { object in
      object.login = login
    }
  }
}
