//
//  SpecialistsRepository.swift
//  SpecialistsCore
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import RxSwift

public protocol SpecialistsRepository {
  func getList(page: Int, cityID: Int, searchQuery: String?) -> Single<[Specialist]>
  func getSingle(with ID: Int) -> Single<Specialist>
}