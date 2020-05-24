//
//  SpecialistsUseCaseImplementation.swift
//  SpecialistsImplementation
//
//  Created by Blake Rxxk on 19.05.2020.
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
  public func invoke(request: SpecialistsRequest) -> Observable<[Specialist]> {
    switch request.scope {
    case .all:
      return specialistRepository
        .getList(page: request.page, cityID: request.cityID, searchQuery: request.query)
        .catchError { _ -> PrimitiveSequence<SingleTrait, [Specialist]> in
          .just([])
        }.asObservable()
    case .my:
      return .just([])
    }
  }
}
