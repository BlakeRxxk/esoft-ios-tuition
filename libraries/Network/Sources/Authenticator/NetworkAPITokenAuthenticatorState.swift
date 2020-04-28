//
//  NetworkAPITokenAuthenticatorState.swift
//  Network
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation

public enum NetworkAPITokenAuthenticatorState: CustomStringConvertible {
  case invoked
  case skippedHandlingBecauseOfMissingToken
  case skippedHandlingBecauseOfWrongErrorCode(_ code: Int)
  case skippedHandlingBecauseOfBusinessLogic
  case waitingForTokenRenewWhichIsInProgress
  case finishedWaitingForTokenRenew
  case retryingRequestWithNewToken
  case startedTokenRefresh
  case tokenRenewSucceeded
  case tokenRenewError(_ error: Error)
  
  public var description: String {
    switch self {
    case .invoked:
      return "invoked"
    case .skippedHandlingBecauseOfMissingToken:
      return "skippedHandlingBecauseOfMissingToken"
    case let .skippedHandlingBecauseOfWrongErrorCode(errorCode):
      return "skippedHandlingBecauseOfWrongErrorCode - \(errorCode)"
    case .skippedHandlingBecauseOfBusinessLogic:
      return "skippedHandlingBecauseOfBusinessLogic"
    case .waitingForTokenRenewWhichIsInProgress:
      return "waitingForTokenRenewWhichIsInProgress"
    case .finishedWaitingForTokenRenew:
      return "finishedWaitingForTokenRenew"
    case .retryingRequestWithNewToken:
      return "retryingRequestWithNewToken"
    case .startedTokenRefresh:
      return "startedTokenRefresh"
    case .tokenRenewSucceeded:
      return "tokenRenewSucceeded"
    case let .tokenRenewError(error):
      return "tokenRenewError: \(error.localizedDescription)"
    }
  }
}
