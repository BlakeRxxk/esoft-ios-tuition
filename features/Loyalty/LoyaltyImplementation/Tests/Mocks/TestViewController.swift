//
//  TestViewController.swift
//  LoyaltyImplementationTests
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import UIKit
import Foundation
import StateKit
import LoyaltyImplementation

final class TestViewController: UIViewController, StatefullView {
  var disposeBag = DisposeBag()
  var isLoadViewInvoked = false
  var bindInvokeCount = 0
  
  override func loadView() {
    self.view = UIView()
    // self.isLoadViewInvoked = true
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    // store?.action.onNext(.fetchLoyalty(page: 1))
  }
  
  // func bind(store: LoyaltyListState) {
  //   self.bindInvokeCount += 1
  // }
}
