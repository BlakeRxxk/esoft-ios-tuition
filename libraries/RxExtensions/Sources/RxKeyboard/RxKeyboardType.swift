//
//  RxKeyboardType.swift
//  RxExtensions
//
//  Copyright © 2018 E-SOFT. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

public protocol RxKeyboardType {
  var frame: Driver<CGRect> { get }
  var visibleHeight: Driver<CGFloat> { get }
  var willShowVisibleHeight: Driver<CGFloat> { get }
  var isHidden: Driver<Bool> { get }
}
