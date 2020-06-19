//
//  CitiesGetaway.swift
//  AuthCore#iphonesimulator-x86_64
//
//  Created by nedstar on 13.06.2020.
//

import Foundation
import RxSwift

public protocol CitiesGateway {
  func getList(url: URL) -> Single<[City]>
}
