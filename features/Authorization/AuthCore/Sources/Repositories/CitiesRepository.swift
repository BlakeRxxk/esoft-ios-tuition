//
//  CitiesRepositories.swift
//  AuthCore#iphonesimulator-x86_64
//
//  Created by nedstar on 13.06.2020.
//

import RxSwift

public protocol CitiesRepository {
  func getList(searchQuery: String?) -> Single<[City]>
}
