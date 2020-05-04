//
//  TestViewController.swift
//  StateKitTests
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation
import StateKit
import UIKit

typealias OSViewController = UIViewController
typealias OSView = UIView

final class TestViewController: OSViewController, StatefullView {
  var disposeBag = DisposeBag()
  var isLoadViewInvoked = false
  var bindInvokeCount = 0
  
  override func loadView() {
    self.view = OSView()
    self.isLoadViewInvoked = true
  }
  
  func bind(store: TestStore) {
    self.bindInvokeCount += 1
  }
}
