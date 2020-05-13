//
//  RxListAdapterDataSourceType.swift
//  ListKit
//
//  Copyright © 2019 E-SOFT. All rights reserved.
//

import Foundation
import IGListKit.IGListAdapter
import RxSwift

public protocol RxListAdapterDataSourceType: AnyObject {
  associatedtype Element
  func listAdapter(_ adapter: ListAdapter, observedEvent: Event<Element>)
}
