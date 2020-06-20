//
//  LoyaltyStorageImplementation.swift
//  LoyaltyImplementation
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation
import StorageKit
import LoyaltyCore
import RxSwift

public final class LoyaltyStorageImplementation {
  var inMemoryStorage: StorageImplementation<Loyalty>
  
  public init(inMemoryConfiguration: StorageConfiguration) {
    let config = inMemoryConfiguration.configuration
    self.inMemoryStorage = StorageImplementation<Loyalty>(configuration: config)
  }
}

extension LoyaltyStorageImplementation: LoyaltyStorage {
  public func fetchLoyalty() -> Single<Int> {
    inMemoryStorage.query().map { $0.count }.asSingle()
  }

  public func fetchLoyalty(loyaltyID: Int) -> Single<Loyalty> {
    let predicate = NSPredicate(format: "id == %d", loyaltyID)
    return inMemoryStorage
      .query(with: predicate)
      .flatMapLatest { result -> Observable<Loyalty> in
        guard let loyalty = result.first else {
          return .error(NSError(domain: "not found", code: 101, userInfo: nil))
        }
        
        return .just(loyalty)
    }.asSingle()
  }
  
  public func saveLoyalty(loyalty: [Loyalty]) -> Completable {
    inMemoryStorage.save(entities: loyalty, updateAllow: true)
  }
}
