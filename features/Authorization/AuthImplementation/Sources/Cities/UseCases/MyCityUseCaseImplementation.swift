//
//  MyCityUseCaseImplementation.swift
//  AuthImplementation#iphonesimulator-x86_64
//
//  Created by nedstar on 16.06.2020.
//

import RxSwift
import Network
import AuthCore

public final class MyCityUseCaseImplementation {
  private var myCityRepository: MyCityRepository
  
  public init(myCityRepository: MyCityRepository) {
    self.myCityRepository = myCityRepository
  }
}

extension MyCityUseCaseImplementation: MyCityUseCase {
  public func invoke(request: MyCityRequest) -> Observable<MyCity> {
    myCityRepository.getSingle(coords: request.coords, searchQuery: request.query).asObservable()
  }
}
