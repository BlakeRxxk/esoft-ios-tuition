//
//  NetworkAPITokenAuthenticatorLogger.swift
//  Network
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation

public protocol NetworkAPITokenAuthenticatorLogger {
  func log(state: NetworkAPITokenAuthenticatorState)
}
