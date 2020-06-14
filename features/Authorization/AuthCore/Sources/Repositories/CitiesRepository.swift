//
//  SpecialistsRepository.swift
//  SpecialistsCore
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import RxSwift

public protocol CitiesRepository {
  func getList(searchQuery: String?) -> Single<[City]>
}
