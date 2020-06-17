//
//  MyCityRepositoryImplementation.swift
//  AuthImplementation#iphonesimulator-x86_64
//
//  Created by nedstar on 16.06.2020.
//

import RxSwift
import Network
import AuthCore

public final class MyCityRepositoryImplementation {
  private var myCityGateway: MyCityGateway
  private var myCityStorage: MyCityStorage

  public init(myCityGateway: MyCityGateway, myCityStorage: MyCityStorage) {
    self.myCityGateway = myCityGateway
    self.myCityStorage = myCityStorage
  }
}

extension MyCityRepositoryImplementation: MyCityRepository {
  public func getSingle(coords: Coords, searchQuery: String?) -> Single<MyCity> {
    let request = MyCityQuery(coords: coords)

    return myCityGateway
      .getSingle(url: request.url)
      .flatMap { [weak self] myCity -> Single<MyCity> in
        guard let self = self else { return .error(NSError(domain: "unknown", code: 102, userInfo: nil)) }
        
        return self.myCityStorage
          .saveCity(city: myCity)
          .andThen(Single.just(myCity))
    }
  }
}
