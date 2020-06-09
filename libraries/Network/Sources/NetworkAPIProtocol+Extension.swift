//
//  NetworkAPIProtocol+Extension.swift
//  Network
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation
import RxSwift

extension NetworkAPIProtocol {
  public func absoluteURL(_ endpoint: String) -> URL {
    baseUrl.appendingPathComponent(endpoint)
  }
  
  func rxDataRequest(_ request: URLRequest, qos: DispatchQoS) -> Single<Data> {
    session
      .fetch(request, interceptors: requestInterceptors)
      .observeOn(ConcurrentDispatchQueueScheduler(qos: qos))
      .flatMap { request, response, data -> Observable<Data>  in
        if let cache = self.cache,
          let urlCache = self.session.base.configuration.urlCache,
          let cachedResponse = cache.cache(response,
                                           request: request,
                                           data: data) {
          urlCache.storeCachedResponse(cachedResponse,
                                       for: request)
        }
        
        return Observable.just(data)
    }
    .asSingle()
    .catchError { error -> Single<Data> in
      guard
        let authenticator = self.authenticator,
        case let NetworkAPIError.httpError(request, response, data) = error,
        let retryRequest = authenticator.authenticate(session: self.session,
                                                      request: request,
                                                      response: response,
                                                      data: data)
        else { throw error }
      
      return retryRequest
    }
  }
  
  func rxDataRequest<D: Decodable>(_ request: URLRequest, qos: DispatchQoS) -> Single<D> {
    rxDataRequest(request, qos: qos).flatMap { data in
      do {
        let decoded = try self.decoder.decode(D.self, from: data)
        return Single.just(decoded)
      } catch {
        guard let underlyingError = error as? DecodingError
          else { return Single.error(error) }
        
        let decodingError = NetworkAPIError.decodingError(underlyingError, data: data)
        return Single.error(decodingError)
      }
    }
  }
  
  func rxDataRequestDiscardingPayload(_ request: URLRequest, qos: DispatchQoS) -> Single<Void> {
    rxDataRequest(request, qos: qos).map { _ in () }
  }
}

public extension NetworkAPIProtocol {
  // body params as dictionary and generic response type
  func request<D: Decodable>(_ method: NetworkAPIHTTPMethod = .get,
                             url: URL,
                             headers: [String: Any?]? = nil,
                             queryParams: [String: Any?]? = nil,
                             bodyParams: [String: Any?]? = nil,
                             qos: DispatchQoS = .userInitiated) -> Single<D> {
    do {
      let request = try URLRequest.createForJSON(with: url,
                                                 method: method,
                                                 headers: headers,
                                                 queryParams: queryParams,
                                                 bodyParams: bodyParams,
                                                 queryStringTypeConverter: queryStringTypeConverter)
      return rxDataRequest(request, qos: qos)
    } catch {
      return Single.error(error)
    }
  }
  
  // body params as encodable and generic response type
  func request<E: Encodable, D: Decodable>(_ method: NetworkAPIHTTPMethod = .get,
                                           url: URL,
                                           headers: [String: Any?]? = nil,
                                           queryParams: [String: Any?]? = nil,
                                           body: E? = nil,
                                           qos: DispatchQoS = .userInitiated) -> Single<D> {
    do {
      let request = try URLRequest.createForJSON(with: url,
                                                 method: method,
                                                 headers: headers,
                                                 queryParams: queryParams,
                                                 body: body,
                                                 encoder: encoder,
                                                 queryStringTypeConverter: queryStringTypeConverter)
      return rxDataRequest(request, qos: qos)
    } catch {
      return Single.error(error)
    }
  }
  
  // body params as dictionary and void response type
  func request(_ method: NetworkAPIHTTPMethod = .get,
               url: URL,
               headers: [String: Any?]? = nil,
               queryParams: [String: Any?]? = nil,
               bodyParams: [String: Any?]? = nil,
               qos: DispatchQoS = .userInitiated) -> Single<Void> {
    do {
      let request = try URLRequest.createForJSON(with: url,
                                                 method: method,
                                                 headers: headers,
                                                 queryParams: queryParams,
                                                 bodyParams: bodyParams,
                                                 queryStringTypeConverter: queryStringTypeConverter)
      return rxDataRequestDiscardingPayload(request, qos: qos)
    } catch {
      return Single.error(error)
    }
  }
  
  // body params as encodable and void response type
  func request<E: Encodable>(_ method: NetworkAPIHTTPMethod = .get,
                             url: URL,
                             headers: [String: Any?]? = nil,
                             queryParams: [String: Any?]? = nil,
                             body: E? = nil,
                             qos: DispatchQoS = .userInitiated) -> Single<Void> {
    do {
      let request = try URLRequest.createForJSON(with: url,
                                                 method: method,
                                                 headers: headers,
                                                 queryParams: queryParams,
                                                 body: body,
                                                 encoder: encoder,
                                                 queryStringTypeConverter: queryStringTypeConverter)
      return rxDataRequestDiscardingPayload(request, qos: qos)
    } catch {
      return Single.error(error)
    }
  }
}
