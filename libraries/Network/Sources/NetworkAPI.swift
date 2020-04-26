//
//  NetworkAPI.swift
//  Network
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation
import RxSwift

open class NetworkAPI: NetworkAPIProtocol {
  public let session: Reactive<URLSession>
  public let decoder: NetworkAPIDecoder
  public let encoder: JSONEncoder
  public let baseUrl: URL
  public var authenticator: NetworkAPIAuthenticator?
  public var requestInterceptors: [NetworkAPIRequestInterceptor] = []
  public var cache: NetworkAPICache?
  public var queryStringTypeConverter: NetworkAPITypeConverter?
  
  required public init(session: Reactive<URLSession>,
                       decoder: NetworkAPIDecoder = JSONDecoder(),
                       encoder: JSONEncoder = JSONEncoder(),
                       baseUrl: URL) {
    self.session = session
    self.decoder = decoder
    self.encoder = encoder
    self.baseUrl = baseUrl
  }
}
