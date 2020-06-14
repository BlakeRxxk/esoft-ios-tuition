//
//  AuthenticationType.swift
//  KeychainKit
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation

public enum AuthenticationType {
  case ntlm
  case msn
  case dpa
  case rpa
  case httpBasic
  case httpDigest
  case htmlForm
  case `default`
}
