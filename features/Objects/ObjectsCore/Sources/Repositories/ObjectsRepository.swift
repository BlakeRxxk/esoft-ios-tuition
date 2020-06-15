//
//  ObjectsRepository.swift
//  ObjectsCore#iphonesimulator-x86_64
//
//  Created by Алексей Макаров on 26.05.2020.
//

import RxSwift

public protocol ObjectsRepository {
  func getObjects() -> Single<[Object]>
}
