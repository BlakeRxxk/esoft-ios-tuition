//
//  TestViewController.swift
//  SpecialistsUITests
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import UIKit
import Foundation
import StateKit
import SpecialistsUI

final class TestViewController: UIViewController, StatefullView {
  var disposeBag = DisposeBag()
  var isLoadViewInvoked = false
  var bindInvokeCount = 0
  
  override func loadView() {
    self.view = UIView()
    self.isLoadViewInvoked = true
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    store?.action.onNext(.fetchSpecialists(page: 1))
  }
  
  func bind(store: SpecialistsListState) {
    self.bindInvokeCount += 1
  }
}
