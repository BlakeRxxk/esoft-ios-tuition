//
//  Object+Build.swift
//  StorageKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

extension Object {
  public static func build<T: Object>(_ builder: (T) -> Void ) -> T {
    let object = T()
    builder(object)
    return object
  }
}
