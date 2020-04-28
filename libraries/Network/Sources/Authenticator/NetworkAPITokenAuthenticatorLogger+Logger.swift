//
//  NetworkAPITokenAuthenticatorLogger+Logger.swift
//  Network
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation
import Logger

public struct NetworkLogger: NetworkAPITokenAuthenticatorLogger {
  private var logger: Logger = Logger()
  
  public func log(state: NetworkAPITokenAuthenticatorState) {
    #if DEBUG
    logger.log(category: .network, message: state.description, access: .public, type: .debug)
    #else
    logger.log(category: .network, message: state.description, access: .private, type: .info)
    #endif
  }
}
