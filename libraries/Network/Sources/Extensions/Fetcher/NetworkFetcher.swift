//
//  NetworkFetcher.swift
//  Network
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation
import RxSwift

public struct NetworkFetcher<Input, Output> {
  public typealias Service = (Input) -> Single<Output>
  public let fetcher = PublishSubject<Input>()
  
  private let operation: Observable<LoadingResult<Output>>

  public var output: Observable<Output> {
    operation.events
      .filter { $0.event.element != nil }
      .map { $0.event.element! }
  }
  
  public var error: Observable<Error> {
    operation.events
      .filter { $0.event.error != nil }
      .map { $0.event.error! }
  }
  
  public var isLoading: Observable<Bool> {
    operation
      .map { $0.loading }
      .startWith(false)
      .distinctUntilChanged()
  }
  
  public var isCompleted: Observable<Void> {
    operation.events
      .filter { $0.event.isCompleted }
      .map { _ in }
  }
  
  public init(service: @escaping Service) {
    operation = fetcher
      .flatMapLatest { service($0).asObservable().monitorLoading() }
      .share()
  }
}
