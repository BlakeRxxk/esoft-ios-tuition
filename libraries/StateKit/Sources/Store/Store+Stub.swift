//
//  Store+Stub.swift
//  StateKit
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation

extension Store {
  public var isStubEnabled: Bool {
    get { MapTables.isStubEnabled.value(forKey: self, default: false) }
    set { MapTables.isStubEnabled.setValue(newValue, forKey: self) }
  }
  
  public var stub: Stub<Self> {
    MapTables.stub.forceCastedValue(forKey: self,
                                    default: .init(store: self, disposeBag: self.disposeBag))
  }
}
