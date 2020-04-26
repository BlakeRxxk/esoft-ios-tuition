//
//  NetworkAPIProtocol.swift
//  Network
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation
import RxSwift

public typealias NetworkAPITypeConverter = (_ value: Any?) -> String?

public protocol NetworkAPIDecoder {
  func decode<T>(_ type: T.Type, from data: Data) throws -> T where T: Decodable
}

public protocol NetworkAPIProtocol {
  var baseUrl: URL { get }
  var session: Reactive<URLSession> { get }
  var decoder: NetworkAPIDecoder { get }
  var encoder: JSONEncoder { get }
  var authenticator: NetworkAPIAuthenticator? { get set }
  var requestInterceptors: [NetworkAPIRequestInterceptor] { get set }
  var queryStringTypeConverter: NetworkAPITypeConverter? { get set }
  var cache: NetworkAPICache? { get set }
  func absoluteURL(_ endpoint: String) -> URL
}
