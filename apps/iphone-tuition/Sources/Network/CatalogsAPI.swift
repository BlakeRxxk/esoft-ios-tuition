//
//  CatalogsAPI.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Network
import RxSwift
import SpecialistsCore

final class CatalogsAPI: NetworkAPI {
  
  func getSpecialists(url: URL) -> Observable<Event<Response<[Specialist]>>> {
    request(url: url).asObservable().materialize()
  }
}
