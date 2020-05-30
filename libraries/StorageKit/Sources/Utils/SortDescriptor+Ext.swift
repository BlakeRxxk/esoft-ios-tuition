//
//  SortDescriptor+Ext.swift
//  StorageKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

extension SortDescriptor {
  init(sortDescriptor: NSSortDescriptor) {
    let keyPath = sortDescriptor.key ?? ""
    let ascending = sortDescriptor.ascending
    self.init(keyPath: keyPath, ascending: ascending)
  }
}
