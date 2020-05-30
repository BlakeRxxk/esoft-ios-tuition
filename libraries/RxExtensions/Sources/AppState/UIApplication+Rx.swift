//
//  UIApplication+Rx.swift
//  RxExtensions
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

extension RxSwift.Reactive where Base: UIApplication {
  struct DefaultName {
    static var didOpenAppCount: String { "EsoftAppState_numDidOpenApp" }
    static var previousAppVersion: String { "EsoftAppState_previousAppVersion" }
    static var currentAppVersion: String { "EsoftAppState_currentAppVersion" }
  }
  
  public var applicationWillEnterForeground: Observable<AppState> {
    NotificationCenter
      .default
      .rx
      .notification(UIApplication.willEnterForegroundNotification)
      .map { _ in .inactive }
  }
  
  public var applicationDidBecomeActive: Observable<AppState> {
    NotificationCenter
      .default
      .rx
      .notification(UIApplication.didBecomeActiveNotification)
      .map { _ in .active }
  }
  
  public var applicationDidEnterBackground: Observable<AppState> {
    NotificationCenter
      .default
      .rx
      .notification(UIApplication.didEnterBackgroundNotification)
      .map { _ in .background }
  }
  
  public var applicationWillResignActive: Observable<AppState> {
    NotificationCenter
      .default
      .rx
      .notification(UIApplication.willResignActiveNotification)
      .map { _ in .inactive }
  }
  
  public var applicationWillTerminate: Observable<AppState> {
    NotificationCenter
      .default
      .rx
      .notification(UIApplication.willTerminateNotification)
      .map { _ in .terminated }
  }
  
  public var appState: Observable<AppState> {
    Observable.of(
      applicationDidBecomeActive,
      applicationWillResignActive,
      applicationWillEnterForeground,
      applicationDidEnterBackground,
      applicationWillTerminate
    ).merge()
  }
  
  public var didOpenApp: Observable<Void> {
    Observable.of(
      applicationDidBecomeActive,
      applicationDidEnterBackground
    )
      .merge()
      .distinctUntilChanged()
      .filter { $0 == .active }
      .map { _ in }
  }
  
  public var didOpenAppCount: Observable<Int> {
    base.sharedRxAppState.didOpenAppCount
  }
  
  public var isFirstLaunch: Observable<Bool> {
    base.sharedRxAppState.isFirstLaunch
  }
  
  public var appVersion: Observable<AppVersion> {
    base.sharedRxAppState.appVersion
  }
  
  public var isFirstLaunchOfNewVersion: Observable<Bool> {
    base.sharedRxAppState.isFirstLaunchOfNewVersion
  }
  
  public var firstLaunchOfNewVersionOnly: Observable<AppVersion> {
    base.sharedRxAppState.firstLaunchOfNewVersionOnly
  }
  
  public var firstLaunchOnly: Observable<Void> {
    base.sharedRxAppState.firstLaunchOnly
  }
}
