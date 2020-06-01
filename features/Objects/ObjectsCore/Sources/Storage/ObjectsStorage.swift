//
//  ObjectsStorage.swift
//  ObjectsCore#iphonesimulator-x86_64
//
//  Created by Алексей Макаров on 26.05.2020.
//

import RxSwift

protocol ObjectsStorage {
  func fetchObjects() -> Single<Objects>
  func saveObjects(objects: [Objects]) -> Completable
}
