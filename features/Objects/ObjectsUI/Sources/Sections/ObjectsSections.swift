//
//  ObjectsSections.swift
//  ObjectsUI#iphonesimulator-x86_64
//
//  Created by Алексей Макаров on 28.05.2020.
//

import Foundation
import ListKit
import EsoftUIKit
import IGListDiffKit.IGListDiffable

public enum ObjectsSections {
  case header(ListHeaderViewModel)
  case empty(EmptyListViewModel)
  
  case listHeaderSkeleton(ListHeaderSkeletonViewModel)
  case skeleton(ListSkeletonViewModel)
  case objects(ObjectsViewModel)
}

extension ObjectsSections: SectionModelType {
  public typealias ObjectType = ListDiffable
  
  public var object: ListDiffable {
    switch self {
    case .header(let headerViewModel):
      return headerViewModel
    case let .empty(emptyListViewModel):
      return emptyListViewModel
    case let .listHeaderSkeleton(listHeaderSkeleton):
      return listHeaderSkeleton
    case let .skeleton(listSkeleton):
      return listSkeleton
    case let .objects(objectsViewModel):
      return objectsViewModel
    }
  }
  
}
