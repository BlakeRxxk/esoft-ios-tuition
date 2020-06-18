//
//  PasswordGateway.swift
//  AuthCore#iphonesimulator-x86_64
//
//  Created by nedstar on 18.06.2020.
//

import Foundation
import RxSwift

public protocol PasswordGateway {
  func getAvalible(url: URL) -> Single<LoginAvalible>
}
