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
  public func invoke(request: SpecialistsRequest) -> Observable<([Specialist], pages: Int)> {
    switch request.scope {
    case .all:

      return specialistRepository
        .getListCount(cityID: request.cityID, searchQuery: request.query)
        .catchError { _ -> PrimitiveSequence<SingleTrait, SpecialistsCount> in
          .just(SpecialistsCount(count: "0", countryCode: "RU"))
      }.asObservable()
        .flatMapLatest { [weak self] totalCount -> Observable<([Specialist], pages: Int)> in
          guard let self = self else {
            return .empty()
          }
          return self.specialistRepository.getList(page: request.page, cityID: request.cityID, searchQuery: request.query).asObservable().map { specialists -> ([Specialist], pages: Int) in
            return (specialists, pages: Int(totalCount.count)! / 15)
          }
      }
      
    case .my:
      return .just(([], pages: 0))
    }
  }
}
