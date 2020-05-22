//
//  EsoftAppState.swift
//  RxExtensions
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation
import UIKit

public struct EsoftAppState {
  public static var currentAppVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
}

extension EsoftAppState {
  internal static func clearSharedObservables() {
    objc_setAssociatedObject(UIApplication.shared,
                             &sharedRxAppStateKey,
                             nil,
                             .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
  }
}
