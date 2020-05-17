//
//  RxListAdapterMoveDataSource.swift
//  ListKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation
import IGListKit
import RxSwift

public protocol ListAdapterMoving: AnyObject {
  var moving: Bool { get set }
  func setMoving()
}

public final class RxListAdapterMoveDataSource<E: SectionModelType>: RxListAdapterDataSource<E>, ListAdapterMoving {
  public var moving: Bool = false
  
  public override func listAdapter(_ adapter: ListAdapter, observedEvent: Event<[E]>) {
    switch observedEvent {
    case .next(let e):
      objects = e
      if moving {
        moving.toggle()
        return
      }
      adapter.performUpdates(animated: true) { _ in }
    default:
      print(observedEvent)
    }
  }
}

extension ListAdapterMoving {
  public func setMoving() {
    moving = true
  }
}
