//
//  AuthenticatorMock.swift
//  NetworkTests
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation
import Network
import RxSwift

struct AuthenticatorMock: NetworkAPIAuthenticator {
  let code: Int
  
  func authenticate(session: Reactive<URLSession>,
                    request: URLRequest,
                    response: HTTPURLResponse,
                    data: Data?) -> Single<Data>? {
    guard response.statusCode == code else { return nil }
    
    return Single.just(Resources.data)
  }
}
