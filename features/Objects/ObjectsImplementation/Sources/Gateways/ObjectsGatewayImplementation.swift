//
//  ObjectsGatewayImplementation.swift
//  ObjectsImplementation#iphonesimulator-x86_64
//
//  Created by Алексей Макаров on 27.05.2020.
//

import RxSwift
import Network
import ObjectsCore

public final class ObjectsGatewayImplementation: NetworkAPI, ObjectsGateway {
  public func getObjects(url: URL) -> Single<[Objects]> {
    request(url: url)
  }
}
