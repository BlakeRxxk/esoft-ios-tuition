//
//  FetcherTests.swift
//  NetworkTests
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import XCTest
import RxSwift

@testable import Network

final class FetcherTests: XCTestCase {
  func test_Init() {
    let service: (Int) -> Single<Void> = { _ in Single.just(()) }
    let fetcher = NetworkFetcher(service: service)
    let subscription = fetcher.fetcher
      .subscribe(onNext: { XCTAssertEqual(0, $0 % 2) },
                 onError: { _ in XCTFail("fetcher on error") },
                 onCompleted: { XCTFail("fetcher completed") })
    
    fetcher.fetcher.onNext((2))
    fetcher.fetcher.onNext((4))
    fetcher.fetcher.onNext((6))
    subscription.dispose()
  }
}
