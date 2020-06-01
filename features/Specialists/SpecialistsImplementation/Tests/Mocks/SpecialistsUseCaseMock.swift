//
//  SpecialistsUseCaseMock.swift
//  SpecialistsImplementationTests
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import SpecialistsCore
import RxSwift

final class SpecialistsUseCaseMock: SpecialistsUseCase {
  func invoke(request: SpecialistsRequest) -> Observable<([Specialist], pages: Int)> {
    .just(successResponse())
  }
}

extension SpecialistsUseCaseMock {
  func successResponse() -> ([Specialist], pages: Int) {
    ([Specialist(id: "1", fio: "", lkId: 0, phone: "", email: "", photoUrl: "", lk: nil, position: "", positionID: "", managerID: "")], pages: 5)
  }
}
