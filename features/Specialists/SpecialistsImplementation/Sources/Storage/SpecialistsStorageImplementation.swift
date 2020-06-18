//
//  SpecialistsStorageImplementation.swift
//  SpecialistsImplementation
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
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
