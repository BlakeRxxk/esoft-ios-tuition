//
//  RxListAdapterDataSource.swift
//  ListKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation
import IGListKit
import RxSwift

public typealias EmptyViewProvider = (ListAdapter) -> UIView?

public class RxListAdapterDataSource<E: SectionModelType>: NSObject, RxListAdapterDataSourceType, ListAdapterDataSource {
  public typealias Element = [E]
  public typealias SectionControllerProvider = (ListAdapter, E) -> ListSectionController
  
  var objects: Element = []
  
  let sectionControllerProvider: SectionControllerProvider
  let emptyViewProvider: EmptyViewProvider?
  
  public init(sectionControllerProvider: @escaping SectionControllerProvider,
              emptyViewProvider: EmptyViewProvider? = nil) {
    self.sectionControllerProvider = sectionControllerProvider
    self.emptyViewProvider = emptyViewProvider
  }
  
  // MARK: ListAdapterDataSource
  public func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
    objects.map { $0.object }
  }
  
  public func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
    guard let castObj = object as? E.ObjectType else {
      fatalError("\(type(of: object))'s cast error")
    }
    let temp = objects.filter { (e) -> Bool in
      e.object.diffIdentifier().isEqual(castObj.diffIdentifier())
    }
    // temp.count == 1 throwing falat error? can't really name reason why this guard should be here
    // guard temp.count == 1 else {
    //    fatalError("\(type(of: object))'s isEqual(toDiffableObject:) method is not implemented correctly")
    // }
    return sectionControllerProvider(listAdapter, temp.first!)
  }
  
  public func emptyView(for listAdapter: ListAdapter) -> UIView? {
    emptyViewProvider?(listAdapter)
  }
  
  // MARK: RxListAdapterDataSourceType
  public func listAdapter(_ adapter: ListAdapter, observedEvent: Event<Element>) {
    switch observedEvent {
    case .next(let e):
      objects = e
      adapter.performUpdates(animated: true) { _ in
      }
    default:
      print(observedEvent)
    }
  }
}
