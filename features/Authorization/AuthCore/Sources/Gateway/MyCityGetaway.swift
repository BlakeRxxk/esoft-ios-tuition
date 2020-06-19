//
//  MyCityGetaway.swift
//  AuthCore#iphonesimulator-x86_64
//
//  Created by nedstar on 15.06.2020.
//

import Foundation
import RxSwift

public protocol MyCityGateway {
  func getSingle(url: URL) -> Single<MyCity>
}
