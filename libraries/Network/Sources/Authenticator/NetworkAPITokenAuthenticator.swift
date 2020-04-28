//
//  NetworkAPITokenAuthenticator.swift
//  Network
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

public class NetworkAPITokenAuthenticator: NetworkAPIAuthenticator {
  
  private var isRenewingToken = false
  private let currentToken = BehaviorRelay<String?>(value: nil)
  private let tokenHeaderName: String
  private let getCurrentToken: () -> String?
  private let renewToken: () -> Single<String>
  private let shouldRenewToken: (URLRequest, HTTPURLResponse, Data?) -> Bool
  private let logger: NetworkAPITokenAuthenticatorLogger?
  
  public init(tokenHeaderName: String,
              getCurrentToken: @escaping () -> String?,
              renewToken: @escaping () -> Single<String>,
              shouldRenewToken: @escaping(URLRequest, HTTPURLResponse, Data?) -> Bool = { _, _, _ in true },
              logger: NetworkAPITokenAuthenticatorLogger? = nil) {
    self.tokenHeaderName = tokenHeaderName
    self.getCurrentToken = getCurrentToken
    self.renewToken = renewToken
    self.shouldRenewToken = shouldRenewToken
    self.logger = logger
  }
  
  func requestWithNewToken(session: Reactive<URLSession>,
                           request: URLRequest,
                           newToken: String) -> Single<Data> {
    logger?.log(state: .retryingRequestWithNewToken)
    
    var newRequest = request
    newRequest.setValue(newToken, forHTTPHeaderField: tokenHeaderName)
    return session.fetch(newRequest)
      .map { $0.data }
      .asSingle()
  }
  
  public func authenticate(session: Reactive<URLSession>, request: URLRequest, response: HTTPURLResponse, data: Data?) -> Single<Data>? {
    logger?.log(state: .invoked)
    
    guard response.statusCode == 401,
      getCurrentToken() != nil else {
        response.statusCode == 401
          ? logger?.log(state: .skippedHandlingBecauseOfMissingToken)
          : logger?.log(state: .skippedHandlingBecauseOfWrongErrorCode(response.statusCode))
        
        return nil
    }
    
    if !shouldRenewToken(request, response, data) {
      logger?.log(state: .skippedHandlingBecauseOfBusinessLogic)
      return nil
    }
    
    if isRenewingToken {
      logger?.log(state: .waitingForTokenRenewWhichIsInProgress)
      
      return currentToken
        .filter { $0 != nil }
        .map { $0! }
        .take(1)
        .asSingle()
        .flatMap { [weak self] token in
          guard let self = self else {
            return Single.error(NetworkAPIError.unknown)
          }
          self.logger?.log(state: .finishedWaitingForTokenRenew)
          return self.requestWithNewToken(session: session, request: request, newToken: token)
      }
    }
    
    logger?.log(state: .startedTokenRefresh)
    
    setNewToken(token: nil, isRenewing: true)
    
    return renewToken()
      .catchError { [weak self] error in
        guard let self = self else {
          return Single.error(NetworkAPIError.unknown)
        }
        
        self.logger?.log(state: .tokenRenewError(error))
        self.setNewToken(token: nil, isRenewing: false)
        let httpError = NetworkAPIError.httpError(request: request, response: response, data: data ?? Data())
        return Single.error(httpError)
    }.flatMap { [weak self] newToken in
      guard let self = self else {
        return Single.error(NetworkAPIError.unknown)
      }
      
      self.setNewToken(token: newToken, isRenewing: false)
      self.logger?.log(state: .tokenRenewSucceeded)
      return self.requestWithNewToken(session: session, request: request, newToken: newToken)
    }
  }
  
  func setNewToken(token: String?, isRenewing: Bool) {
    if currentToken.value == nil && token != nil || currentToken.value != nil && token != nil {
      isRenewingToken = false
    } else {
      isRenewingToken = isRenewing
    }
    currentToken.accept(token)
  }
}
