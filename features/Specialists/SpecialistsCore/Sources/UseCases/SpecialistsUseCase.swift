//
//  SpecialistsUseCase.swift
//  SpecialistsCore
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import RxSwift

public protocol SpecialistsUseCase {
  func invoke(request: SpecialistsRequest) -> Observable<([Specialist], pages: Int)>
}
