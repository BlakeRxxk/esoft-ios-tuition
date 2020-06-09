//
//  Observable+Elements.swift
//  RxExtensions
//
//  Copyright © 2020 E-SOFT, OOO. All rights reserved.
//

import RxSwift

public extension ObservableType where Element: EventConvertible {
  func elements() -> Observable<Element.Element> {
    compactMap { $0.event.element }
  }
  
  func errors() -> Observable<Swift.Error> {
    compactMap { $0.event.error }
  }
}
