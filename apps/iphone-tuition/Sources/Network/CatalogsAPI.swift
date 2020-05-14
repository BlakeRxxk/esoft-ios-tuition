//
//  CatalogsAPI.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Network
import RxSwift

final class CatalogsAPI: NetworkAPI {
  func getCities(url: URL) -> Single<Response<[City]>> {
    request(url: url)
  }
}
