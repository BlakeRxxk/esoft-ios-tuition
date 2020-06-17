//
//  MyCityRepository.swift
//  AuthCore#iphonesimulator-x86_64
//
//  Created by nedstar on 16.06.2020.
//

import RxSwift

public protocol MyCityRepository {
  func getSingle(coords: Coords, searchQuery: String?) -> Single<MyCity>
}
