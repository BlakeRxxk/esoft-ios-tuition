//
//  NetworkAPIAuthenticator.swift
//  Network
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation
import RxSwift

public protocol NetworkAPIAuthenticator {
  func authenticate(session: Reactive<URLSession>,
                    request: URLRequest,
                    response: HTTPURLResponse,
                    data: Data?) -> Single<Data>?
}
