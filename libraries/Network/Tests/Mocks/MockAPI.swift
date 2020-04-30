//
//  MockAPI.swift
//  NetworkTests
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation
import RxSwift
import Network

class MockAPI: NetworkAPI {
  public static let loginEndpoint = "login"
  public static let renewEndpoint = "renew"
  public static let authenticatedSingleActionEndpoint = "auth-action"
  public static let authenticatedParallelActionEndpoint = "auth-parallel-action"
  
  func login() -> Single<ModelMock> {
    request(url: absoluteURL(MockAPI.loginEndpoint))
  }
  
  func renewToken() -> Single<ModelMock> {
    request(url: absoluteURL(MockAPI.renewEndpoint))
  }
  
  func authenticatedSingleAction() -> Single<ModelMock> {
    request(url: absoluteURL(MockAPI.authenticatedSingleActionEndpoint))
  }
  
  func authenticatedParallelAction() -> Single<ModelMock> {
    request(url: absoluteURL(MockAPI.authenticatedParallelActionEndpoint))
  }
}
