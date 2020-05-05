//
//  TestView.swift
//  StateKitTests
//
//  Copyright © 2020 E-SOFT. All rights reserved.
//

import Foundation
import StateKit

final class TestView: StatefullView {
  var disposeBag = DisposeBag()
  var bindInvokeCount = 0
  
  func bind(store: TestStore) {
    self.bindInvokeCount += 1
  }
}
