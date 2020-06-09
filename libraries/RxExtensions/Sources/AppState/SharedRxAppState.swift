//
//  SharedRxAppState.swift
//  RxExtensions
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct SharedRxAppState {
  typealias DefaultName = Reactive<UIApplication>.DefaultName
  
  let rx: Reactive<UIApplication>
  let disposeBag = DisposeBag()
  
  lazy var didOpenAppCount: Observable<Int> = rx.didOpenApp
    .map { _ in UserDefaults.standard.integer(forKey: DefaultName.didOpenAppCount) }
    .share(replay: 1, scope: .forever)
  
  lazy var isFirstLaunch: Observable<Bool> = rx.didOpenApp
    .map { _ in
      let didOpenAppCount = UserDefaults.standard.integer(forKey: DefaultName.didOpenAppCount)
      return didOpenAppCount == 1
  }
  .share(replay: 1, scope: .forever)
  
  lazy var firstLaunchOnly: Observable<Void> = rx.isFirstLaunch
    .filter { $0 }
    .map { _ in }
  
  lazy var appVersion: Observable<AppVersion> = rx.didOpenApp
    .map { _ in
      let userDefaults = UserDefaults.standard
      let currentVersion: String = userDefaults.string(forKey: DefaultName.currentAppVersion) ?? EsoftAppState.currentAppVersion ?? ""
      let previousVersion: String = userDefaults.string(forKey: DefaultName.previousAppVersion) ?? currentVersion
      return AppVersion(previous: previousVersion, current: currentVersion)
  }
  .share(replay: 1, scope: .forever)
  
  lazy var isFirstLaunchOfNewVersion: Observable<Bool> = appVersion
    .map { version in version.previous != version.current }
  
  lazy var firstLaunchOfNewVersionOnly: Observable<AppVersion> = appVersion
    .filter { $0.previous != $0.current }
  
  init(_ application: UIApplication) {
    rx = application.rx
    rx.didOpenApp
      .subscribe(onNext: updateAppStats)
      .disposed(by: disposeBag)
  }
  
  private func updateAppStats() {
    let userDefaults = UserDefaults.standard
    
    var count = userDefaults.integer(forKey: DefaultName.didOpenAppCount)
    count = min(count + 1, Int.max - 1)
    userDefaults.set(count, forKey: DefaultName.didOpenAppCount)
    
    let previousAppVersion = userDefaults.string(forKey: DefaultName.currentAppVersion) ?? EsoftAppState.currentAppVersion
    let currentAppVersion = EsoftAppState.currentAppVersion
    userDefaults.set(previousAppVersion, forKey: DefaultName.previousAppVersion)
    userDefaults.set(currentAppVersion, forKey: DefaultName.currentAppVersion)
  }
}
