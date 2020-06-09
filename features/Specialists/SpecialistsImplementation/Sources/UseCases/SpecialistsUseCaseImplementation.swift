//
//  SpecialistsUseCaseImplementation.swift
//  SpecialistsImplementation
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import RxSwift
import Network
import SpecialistsCore

public final class SpecialistsUseCaseImplementation {
  private var specialistRepository: SpecialistsRepository
  
  public init(specialistRepository: SpecialistsRepository) {
    self.specialistRepository = specialistRepository
  }
}

extension SpecialistsUseCaseImplementation: SpecialistsUseCase {
  public func invoke(request: SpecialistsRequest) -> Observable<([Specialist], pages: Int)> {
    switch request.scope {
    case .all:
      let countObservable = specialistRepository
        .getListCount(cityID: request.cityID, searchQuery: request.query)
        .asObservable()
      
      let specialistsObservable = specialistRepository
        .getList(page: request.page, cityID: request.cityID, searchQuery: request.query)
        .asObservable()
      
      return Observable
        .zip(specialistsObservable, countObservable)
        .flatMapLatest { result -> Observable<([Specialist], pages: Int)> in
          .just((result.0, pages: Int(result.1.count)! / 15))
      }
      
    case .my:
      return .just(([], pages: 0))
    }
  }
}
