//
//  ObservableViewController.swift
//  AppLibrary
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import RxSwift
import UIKit

class ObservableViewController: UIViewController {
  var lifecycle: Observable<ViewControllerLifecycle> {
    lifecycleSubject.asObservable()
  }
  
  // MARK: - Private
  private let lifecycleSubject = ReplaySubject<ViewControllerLifecycle>.create(bufferSize: 1)
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    lifecycleSubject.onNext(.viewDidAppear)
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    
    lifecycleSubject.onNext(.viewDidDisappear)
  }

  deinit {
    lifecycleSubject.onNext(.deinit)
  }
}
