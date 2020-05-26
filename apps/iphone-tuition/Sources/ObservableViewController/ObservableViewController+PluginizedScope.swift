//
//  ObservableViewController+PluginizedScope.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import RxSwift
import Foundation
import NeedleFoundation

private class NeedleDisposable: ObserverDisposable {
  private let disposable: Disposable
  
  fileprivate init(disposable: Disposable) {
    self.disposable = disposable
  }
  
  fileprivate func dispose() {
    disposable.dispose()
  }
}

extension ObservableViewController: PluginizedScopeLifecycleObservable {
  
  public func observe(_ observer: @escaping (PluginizedScopeLifecycle) -> Void) -> ObserverDisposable {
    let disposable = lifecycle
      .subscribe(onNext: { (event: ViewControllerLifecycle) in
        switch event {
        case .deinit:
          observer(.deinit)
        case .viewDidAppear:
          observer(.active)
        case .viewDidDisappear:
          observer(.inactive)
        }
      })
    return NeedleDisposable(disposable: disposable)
  }
}
