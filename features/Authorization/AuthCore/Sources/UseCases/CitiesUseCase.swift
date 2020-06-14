//
//  SpecialistsUseCase.swift
//  SpecialistsCore
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import RxSwift

public protocol CitiesUseCase {
  func invoke(request: CitiesRequest) -> Observable<[City]>
}
