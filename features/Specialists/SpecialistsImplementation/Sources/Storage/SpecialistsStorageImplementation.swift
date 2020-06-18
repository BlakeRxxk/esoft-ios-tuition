//
//  SpecialistsStorageImplementation.swift
<<<<<<< HEAD
//  SpecialistsImplementation
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
=======
//  SpecialistsImplementation#iphonesimulator-x86_64
//
//  Created by Blake Rxxk on 01.06.2020.
>>>>>>> master
//

import Foundation
import StorageKit
import SpecialistsCore
import RxSwift

public final class SpecialistsStorageImplementation {
  var inMemoryStorage: StorageImplementation<Specialist>
  
  public init(inMemoryConfiguration: StorageConfiguration) {
    let config = inMemoryConfiguration.configuration
    self.inMemoryStorage = StorageImplementation<Specialist>(configuration: config)
  }
}

extension SpecialistsStorageImplementation: SpecialistsStorage {
<<<<<<< HEAD
=======
  public func fetchSpecialist() -> Single<Int> {
    inMemoryStorage.query().map { $0.count }.asSingle()
  }

>>>>>>> master
  public func fetchSpecialist(specialistID: Int) -> Single<Specialist> {
    let predicate = NSPredicate(format: "id == %d", specialistID)
    return inMemoryStorage
      .query(with: predicate)
      .flatMapLatest { result -> Observable<Specialist> in
        guard let specialists = result.first else {
          return .error(NSError(domain: "not found", code: 101, userInfo: nil))
        }
        
        return .just(specialists)
    }.asSingle()
  }
  
  public func saveSpecialists(specialists: [Specialist]) -> Completable {
    inMemoryStorage.save(entities: specialists, updateAllow: true)
  }
}
