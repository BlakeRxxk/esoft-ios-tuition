//
//  ObjectsGateway.swift
//  ObjectsCore#iphonesimulator-x86_64
//
//  Created by Алексей Макаров on 26.05.2020.
//

import Foundation
import RxSwift

public protocol ObjectsGateway {
  func getObjects(url: URL) -> Single<[Object]>
}
