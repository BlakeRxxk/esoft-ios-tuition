//
//  SpecialistsStorage.swift
//  SpecialistsCore
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import RxSwift

protocol SpecialistsStorage {
  func fetchSpecialist(specialistID: Int) -> Single<Specialist>
  func saveSpecialists(specialists: [Specialist]) -> Completable
}
