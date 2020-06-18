//
//  MyCityStorage.swift
//  AuthCore#iphonesimulator-x86_64
//
//  Created by nedstar on 16.06.2020.
//

import RxSwift

public protocol MyCityStorage {
  func fetchCity() -> Single<Int>
  func fetchCity(cityID: Int) -> Single<MyCity>
  func saveCity(city: MyCity) -> Completable
}
