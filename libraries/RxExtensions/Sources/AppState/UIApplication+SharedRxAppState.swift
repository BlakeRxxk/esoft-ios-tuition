//
//  UIApplication+SharedRxAppState.swift
//  RxExtensions
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation
import UIKit

var sharedRxAppStateKey: UInt8 = 0

extension UIApplication {
  var sharedRxAppState: SharedRxAppState {
    get {
      if let stored = objc_getAssociatedObject(self, &sharedRxAppStateKey) as? SharedRxAppState {
        return stored
      }
      let defaultValue = SharedRxAppState(self)
      self.sharedRxAppState = defaultValue
      return defaultValue
    }
    set {
      objc_setAssociatedObject(self, &sharedRxAppStateKey,
                               newValue,
                               .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
  }
}
