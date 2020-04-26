//
//  URLSession+Rx.swift
//  Network
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation
import RxSwift

public typealias FetchResponse = Observable<(request: URLRequest, response: HTTPURLResponse, data: Data)>

extension Reactive where Base: URLSession {
  public func fetch(_ request: URLRequest,
                    interceptors: [NetworkAPIRequestInterceptor]? = nil) -> FetchResponse {
    Observable.create { observer in
      var mutableRequest = request
      interceptors?.forEach { mutableRequest = $0.intercept(mutableRequest) }
      
      let task = self.base.dataTask(with: mutableRequest) { data, response, error in
        guard let response = response, let data = data else {
          observer.onError(error ?? NetworkAPIError.unknown)
          return
        }
        
        guard let httpResponse = response as? HTTPURLResponse else {
          observer.onError(
            NetworkAPIError.nonHttpResponse(response: response)
          )
          return
        }
        
        if httpResponse.statusCode < 200 || httpResponse.statusCode >= 300 {
          observer.onError(
            NetworkAPIError.httpError(request: mutableRequest,
                                      response: httpResponse,
                                      data: data)
          )
          return
        }
        
        observer.onNext((mutableRequest, httpResponse, data))
        observer.onCompleted()
      }
      
      task.resume()
      
      return Disposables.create(with: task.cancel)
    }
  }
}
