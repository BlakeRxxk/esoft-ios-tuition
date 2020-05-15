//
//  ObservableViewController.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import RxSwift
import NeedleFoundation
import UIKit

enum ViewControllerLifecycle {
  case viewDidAppear
  case viewDidDisappear
  case `deinit`
}

class ObservableViewController: UIViewController {
  var lifecycle: Observable<ViewControllerLifecycle> {
    lifecycleSubject.asObservable()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    lifecycleSubject.onNext(.viewDidAppear)
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    
    lifecycleSubject.onNext(.viewDidDisappear)
  }
  
  // MARK: - Private
  private let lifecycleSubject = ReplaySubject<ViewControllerLifecycle>.create(bufferSize: 1)
  
  deinit {
    lifecycleSubject.onNext(.deinit)
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

private class NeedleDisposable: ObserverDisposable {
  
  private let disposable: Disposable
  
  fileprivate init(disposable: Disposable) {
    self.disposable = disposable
  }
  
  fileprivate func dispose() {
    disposable.dispose()
  }
}
