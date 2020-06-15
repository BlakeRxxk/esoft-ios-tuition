//
//  ObjectsUseCaseImplementation.swift
//  ObjectsImplementation#iphonesimulator-x86_64
//
//  Created by Алексей Макаров on 27.05.2020.
//

import RxSwift
//import Network
import ObjectsCore

public final class ObjectsUseCaseImplementation {
  private var objectsRepository: ObjectsRepository
  
  public init(objectsRepository: ObjectsRepository) {
    self.objectsRepository = objectsRepository
  }
}

extension ObjectsUseCaseImplementation: ObjectsUseCase {
  public func invoke(request: ObjectsRequest) -> Observable<[Object]> {
    switch request.scope {
    case .all:
      return objectsRepository
        .getObjects()
        .catchError { _ -> PrimitiveSequence<SingleTrait, [Object]> in
          .just([])
        }.asObservable()
    }
  }
}
