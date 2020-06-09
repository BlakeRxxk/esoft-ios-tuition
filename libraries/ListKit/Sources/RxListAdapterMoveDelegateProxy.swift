//
//  RxListAdapterMoveDelegateProxy.swift
//  ListKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation
import IGListKit
import RxCocoa
import RxSwift

private let listAdapterMoveDelegateNotSet = ListAdapterMoveDelegateNotSet()

private final class ListAdapterMoveDelegateNotSet: NSObject, ListAdapterMoveDelegate {
  func listAdapter(_ listAdapter: ListAdapter, move object: Any, from previousObjects: [Any], to objects: [Any]) {}
}

@available(iOS 9.0, *)
final class RxListAdapterMoveDelegateProxy: DelegateProxy<ListAdapter, ListAdapterMoveDelegate>, DelegateProxyType, ListAdapterMoveDelegate {
  public private(set) weak var adapter: ListAdapter?
  private weak var _requiredMethodsDelegate: ListAdapterMoveDelegate? = listAdapterMoveDelegateNotSet
  // swiftlint:disable:next large_tuple
  private weak var _moveSubject: PublishSubject<(Any, [Any], [Any])>?
  // swiftlint:disable:next large_tuple
  var moveSubject: PublishSubject<(Any, [Any], [Any])> {
    if let subject = _moveSubject {
      return subject
    }
    let subject = PublishSubject<(Any, [Any], [Any])>()
    _moveSubject = subject
    return subject
  }
  
  init(adapter: ParentObject) {
    self.adapter = adapter
    super.init(parentObject: adapter, delegateProxy: RxListAdapterMoveDelegateProxy.self)
  }
  
  static func currentDelegate(for object: ListAdapter) -> ListAdapterMoveDelegate? {
    object.moveDelegate
  }
  
  static func setCurrentDelegate(_ delegate: ListAdapterMoveDelegate?, to object: ListAdapter) {
    object.moveDelegate = delegate
  }
  
  static func registerKnownImplementations() {
    register { RxListAdapterMoveDelegateProxy(adapter: $0) }
  }
  
  func listAdapter(_ listAdapter: ListAdapter, move object: Any, from previousObjects: [Any], to objects: [Any]) {
    _moveSubject?.onNext((object, previousObjects, objects))
    _requiredMethodsDelegate?.listAdapter(listAdapter, move: object, from: previousObjects, to: objects)
  }
  
  override func setForwardToDelegate(_ forwardToDelegate: ListAdapterMoveDelegate?, retainDelegate: Bool) {
    _requiredMethodsDelegate = forwardToDelegate ?? listAdapterMoveDelegateNotSet
    super.setForwardToDelegate(forwardToDelegate, retainDelegate: retainDelegate)
  }
  
  deinit {
    _moveSubject?.onCompleted()
  }
}
